defmodule TzConverter.TimeZones do
  @moduledoc """
  The TimeZone context.
  """

  import Ecto.Query, warn: false
  alias TzConverter.Repo

  alias TzConverter.TimeZones.City
  alias TzConverter.TimeZones.CustomTime

  def change_time(%CustomTime{} = custom_time, attrs \\ %{}) do
    CustomTime.changeset(custom_time, attrs)
  end

  @doc """
  Returns the list of cities.

  ## Examples

      iex> list_cities()
      [%City{}, ...]

  """
  def list_cities do
    Repo.all(City)
  end

  def list_selected_cities do
    Repo.all(City)
    |> Enum.filter(fn city -> city.is_selected == true end)
  end

  def list_deselected_cities do
    Repo.all(City)
    |> Enum.filter(fn city -> city.is_selected == false end)
  end

  def search_by_city_name(""), do: []

  def search_by_city_name(query) do
    list_deselected_cities()
    |> Enum.filter(fn city ->
      String.starts_with?(String.upcase(city.city_name), String.upcase(query))
    end)
  end

  @doc """
  Gets a single city.

  Raises `Ecto.NoResultsError` if the City does not exist.

  ## Examples

      iex> get_city!(123)
      %City{}

      iex> get_city!(456)
      ** (Ecto.NoResultsError)

  """
  def get_city!(id), do: Repo.get!(City, id)

  @doc """
  Creates a city.

  ## Examples

      iex> create_city(%{field: value})
      {:ok, %City{}}

      iex> create_city(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_city(attrs \\ %{}) do
    %City{}
    |> City.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a city.

  ## Examples

      iex> update_city(city, %{field: new_value})
      {:ok, %City{}}

      iex> update_city(city, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_city(%City{} = city, attrs) do
    city
    |> City.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a city.

  ## Examples

      iex> delete_city(city)
      {:ok, %City{}}

      iex> delete_city(city)
      {:error, %Ecto.Changeset{}}

  """
  def delete_city(%City{} = city) do
    Repo.delete(city)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking city changes.

  ## Examples

      iex> change_city(city)
      %Ecto.Changeset{data: %City{}}

  """
  def change_city(%City{} = city, attrs \\ %{}) do
    City.changeset(city, attrs)
  end
end
