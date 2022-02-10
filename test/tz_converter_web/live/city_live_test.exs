defmodule TzConverterWeb.CityLiveTest do
  use TzConverterWeb.ConnCase

  import Phoenix.LiveViewTest

  alias TzConverter.TimeZones

  @create_attrs_not_selected %{
    city_name: "Berlin",
    is_selected: false,
    time_zone: "Europe/Berlin"
  }
  @create_attrs_selected %{
    city_name: "New York",
    is_selected: true,
    time_zone: "America/New_York"
  }

  defp fixture_s(:city) do
    {:ok, city} = TimeZones.create_city(@create_attrs_selected)
    city
  end

  defp fixture_n(:city) do
    {:ok, city} = TimeZones.create_city(@create_attrs_not_selected)
    city
  end

  defp create_new_york_selected() do
    city = fixture_s(:city)
    city
  end

  defp create_berlin_not_selected() do
    city = fixture_n(:city)
    %{city: city}
  end

  describe "Index" do
    test "user can search for a city", %{conn: conn} do
      create_berlin_not_selected()
      {:ok, view, _html} = live(conn, "/")

      view
      |> form("#search-city", %{"city_search_query" => "Berlin"})
      |> render_change

      assert has_element?(view, "#search-results-city-name", "Berlin")
    end

    test "user can search for a city with autocomplete", %{conn: conn} do
      create_berlin_not_selected()
      {:ok, view, _html} = live(conn, "/")

      view
      |> form("#search-city", %{"city_search_query" => "B"})
      |> render_change

      assert has_element?(view, "#search-results-city-name", "Berlin")
    end

    test "user can view selected city", %{conn: conn} do
      create_new_york_selected()
      {:ok, view, _html} = live(conn, "/")

      assert has_element?(view, "#selected-city-name", "New York")
    end

    test "user can search for a city, add it & view it", %{conn: conn} do
      create_berlin_not_selected()
      create_new_york_selected()
      {:ok, view, _html} = live(conn, "/")

      view
      |> form("#search-city", %{"city_search_query" => "Berlin"})
      |> render_change

      view
      |> element("#select-city")
      |> render_click()

      assert has_element?(view, "#selected-city-name", "Berlin")
      assert has_element?(view, "#selected-city-name", "New York")
    end

    test "user can remove city", %{conn: conn} do
      city = create_new_york_selected()
      {:ok, view, _html} = live(conn, "/")

      view
      |> element("#deselect-city-#{city.id}")
      |> render_click()

      assert !has_element?(view, "#selected-city-name", "New York")
    end

    test "user sets custom time", %{conn: conn} do
      city = create_new_york_selected()
      {:ok, view, _html} = live(conn, "/")

      view
      |> form("#set-time", %{"custom_time[custom_time]" => "12:30"})
      |> render_submit()

      assert has_element?(view, "#selected-city-time-#{city.id}", "07:30:00")
    end

    test "user sets custom time and then sets back to current time", %{conn: conn} do
      city = create_new_york_selected()
      {:ok, view, _html} = live(conn, "/")

      current_time =
        assert view
               |> element("#selected-city-time-#{city.id}")
               |> render()
               |> String.slice(32..-9)

      view
      |> form("#set-time", %{"custom_time[custom_time]" => "12:30"})
      |> render_submit()

      assert has_element?(view, "#selected-city-time-#{city.id}", "07:30:00")

      view
      |> element("#use-current-time")
      |> render_click()

      assert has_element?(view, "#selected-city-time-#{city.id}", current_time)
    end

    test "page renders with current time pre-filled in selector", %{conn: conn} do
      create_new_york_selected()
      {:ok, _view, html} = live(conn, "/")

      assert html =~ String.slice(Time.to_string(Time.truncate(Time.utc_now(), :second)), 0..-4)
    end
  end
end
