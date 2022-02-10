defmodule TzConverter.Repo.Migrations.CreateCities do
  use Ecto.Migration

  def change do
    create table(:cities) do
      add :city_name, :string
      add :time_zone, :string
      add :is_selected, :boolean, default: false, null: false

      timestamps()
    end

  end
end
