defmodule TzConverter.TimeZones.CustomTime do
  use Ecto.Schema
  import Ecto.Changeset

  schema "custom_times" do
    field :custom_time, :naive_datetime
  end

  @doc """
  Takes in user custom time, and if it isn't empty,
  it coverts it to timezoned datetime (formats it) and validates it.
  """
  def changeset(custom_time, attrs) do
    attrs =
      if Map.has_key?(attrs, :custom_time) do
        {_, formatted_custom_time} = format_custom_time(attrs.custom_time)

        %{custom_time: formatted_custom_time}
      else
        attrs
      end

    custom_time
    |> cast(attrs, [:custom_time])
    |> validate_required([:custom_time])
  end

  def format_custom_time(custom_time) do
    default_year = "3000-12-31"
    NaiveDateTime.from_iso8601("#{default_year} #{custom_time}:00")
  end

  def format_custom_time!(custom_time) do
    default_year = "3000-12-31"
    NaiveDateTime.from_iso8601!("#{default_year} #{custom_time}:00")
  end
end
