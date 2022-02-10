defmodule TzConverter.TimeZones.City do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cities" do
    field :city_name, :string
    field :is_selected, :boolean, default: false
    field :time_zone, :string

    timestamps()
  end

  @doc false
  def changeset(city, attrs) do
    city
    |> cast(attrs, [:city_name, :time_zone, :is_selected])
    |> validate_required([:city_name, :time_zone, :is_selected])
    |> unique_constraint(:city_name)
  end
end
