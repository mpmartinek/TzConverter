defmodule TzConverterWeb.CityLive.Index do
  use TzConverterWeb, :live_view

  alias TzConverter.TimeZones
  alias TzConverter.TimeZones.CustomTime

  # default timezone for when browser does't provide one
  @default_timezone "Etc/UTC"

  @impl true
  def mount(_params, _session, socket) do
    # assigns a ticker atom -> used to flag if ticker needs to pause
    socket = assign(socket, :ticker, nil)

    # clock ticker - separate for cities, so they can stop ticking when custom user time is set
    if connected?(socket) do
      :timer.send_interval(1000, self(), :tick_clock)
      :timer.send_interval(1000, self(), :tick_cities)
    end

    socket =
      socket
      |> assign(:custom_time, %CustomTime{})
      |> assign(:city_search_query, "")
      |> assign(:searched_city_results, [])
      |> assign_user_timezone()
      # ticks main clock and prefills custom time box
      |> tick_clock()
      |> get_selected_cities()
      |> tick_cities()
      # changeset for custom time
      |> assign_changeset()

    {:ok, socket}
  end

  @impl true
  def handle_event("select_city", %{"id" => id}, socket) do
    select_city(id)

    socket =
      socket
      |> get_selected_cities()
      |> assign_city_search_results()

    {:noreply, socket}
  end

  @impl true
  def handle_event("deselect_city", %{"id" => id}, socket) do
    deselect_city(id)

    socket =
      socket
      |> assign_city_search_results()
      |> get_selected_cities()

    {:noreply, socket}
  end

  def handle_event("search_city", %{"city_search_query" => city_search_query}, socket) do
    socket =
      socket
      |> assign_city_search_query(city_search_query)
      |> assign_city_search_results()

    {:noreply, socket}
  end

  def handle_event("set_time", %{"custom_time" => custom_time}, socket) do
    default_year = "3000-12-31"

    formatted_custom_time =
      NaiveDateTime.from_iso8601!("#{default_year} #{custom_time}:00")
      |> DateTime.from_naive!(socket.assigns.user_timezone)

    socket =
      socket
      |> stop_city_ticker()
      |> tick_cities(formatted_custom_time)
      |> assign(:custom_time, custom_time)

    {:noreply, socket}
  end

  def handle_event("start_city_ticker", _params, socket) do
    {:noreply, start_city_ticker(socket)}
  end

  @impl true
  def handle_event("validate_custom_time", %{"custom_time" => custom_time}, socket) do
    %{"custom_time" => custom_time} = custom_time

    changeset =
      %TzConverter.TimeZones.CustomTime{}
      |> TimeZones.change_time(%{custom_time: custom_time})
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("set_custom_time", %{"custom_time" => custom_time}, socket) do
    %{"custom_time" => custom_time} = custom_time
    custom_time_map = %{custom_time: custom_time}

    changeset =
      %TzConverter.TimeZones.CustomTime{}
      |> TimeZones.change_time(%{custom_time: custom_time})
      |> Map.put(:action, :validate)

    formatted_custom_time =
      CustomTime.format_custom_time!(custom_time)
      |> DateTime.from_naive!(socket.assigns.user_timezone)

    socket =
      socket
      |> stop_city_ticker()
      |> tick_cities(formatted_custom_time)
      |> assign(:custom_time, custom_time_map)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  @impl true
  def handle_info(:tick_clock, socket) do
    {:noreply, tick_clock(socket)}
  end

  def handle_info(:tick_cities, socket) do
    if socket.assigns.ticker !== false do
      {:noreply, tick_cities(socket)}
    else
      {:noreply, socket}
    end
  end

  defp assign_user_timezone(socket) do
    user_timezone = get_connect_params(socket)["timezone"] || @default_timezone

    assign(socket, user_timezone: user_timezone)
  end

  defp assign_changeset(%{assigns: %{custom_time: custom_time}} = socket) do
    socket
    |> assign(:changeset, TzConverter.TimeZones.change_time(custom_time))
  end

  defp assign_city_search_query(socket, query) do
    assign(socket, :city_search_query, query)
  end

  defp assign_city_search_results(socket) do
    assign(
      socket,
      :searched_city_results,
      TimeZones.search_by_city_name(socket.assigns.city_search_query)
    )
  end

  defp start_city_ticker(socket) do
    assign(socket, :ticker, true)
    |> assign(:custom_time, %CustomTime{})
    |> tick_cities()
  end

  defp stop_city_ticker(socket) do
    assign(socket, :ticker, false)
  end

  defp tick_clock(socket) do
    now_sec =
      get_zoned_utc_datetime()
      |> convert_tz_sec_prec(socket.assigns.user_timezone || @default_timezone)

    now_min =
      get_zoned_utc_datetime()
      |> convert_tz_min_prec(socket.assigns.user_timezone || @default_timezone)

    socket
    |> assign(now_sec: now_sec)
    |> assign(now_min: now_min)
  end

  defp tick_cities(socket, custom_time \\ nil) do
    current_time = custom_time || get_zoned_utc_datetime()

    selected_cities_w_time =
      Enum.map(socket.assigns.selected_cities_w_time, fn city ->
        %{
          id: city.id,
          city_name: city.city_name,
          time_zone: city.time_zone,
          is_selected: city.is_selected,
          current_time: convert_tz_sec_prec(current_time, city.time_zone)
        }
      end)

    assign(socket, :selected_cities_w_time, selected_cities_w_time)
  end

  defp select_city(city_id) do
    TimeZones.get_city!(city_id)
    |> TimeZones.update_city(%{is_selected: true})
  end

  defp deselect_city(city_id) do
    TimeZones.get_city!(city_id)
    |> TimeZones.update_city(%{is_selected: false})
  end

  defp get_selected_cities(socket) do
    cities =
      Enum.map(TimeZones.list_selected_cities(), fn city ->
        %{
          id: city.id,
          city_name: city.city_name,
          time_zone: city.time_zone,
          is_selected: city.is_selected,
          current_time: ""
        }
      end)

    socket
    |> assign(:selected_cities_w_time, cities)
    |> tick_cities
  end

  defp get_zoned_utc_datetime() do
    DateTime.from_naive!(NaiveDateTime.utc_now(), @default_timezone)
  end

  defp convert_tz_sec_prec(current_time, new_timezone) do
    String.slice(
      Time.to_string(DateTime.to_time(DateTime.shift_zone!(current_time, new_timezone))),
      0,
      8
    )
  end

  defp convert_tz_min_prec(current_time, new_timezone) do
    String.slice(
      Time.to_string(DateTime.to_time(DateTime.shift_zone!(current_time, new_timezone))),
      0,
      5
    )
  end
end
