# defmodule TzConverter.TimeZonesTest do
#   use TzConverter.DataCase
#
#   alias TzConverter.TimeZones
#
#   describe "cities" do
#     alias TzConverter.TimeZones.City
#
#     @valid_attrs %{city_name: "some city_name", is_selected: true, time_zone: "some time_zone"}
#     @update_attrs %{city_name: "some updated city_name", is_selected: false, time_zone: "some updated time_zone"}
#     @invalid_attrs %{city_name: nil, is_selected: nil, time_zone: nil}
#
#     def city_fixture(attrs \\ %{}) do
#       {:ok, city} =
#         attrs
#         |> Enum.into(@valid_attrs)
#         |> TimeZones.create_city()
#
#       city
#     end
#
#     test "list_cities/0 returns all cities" do
#       city = city_fixture()
#       assert TimeZones.list_cities() == [city]
#     end
#
#     test "get_city!/1 returns the city with given id" do
#       city = city_fixture()
#       assert TimeZones.get_city!(city.id) == city
#     end
#
#     test "create_city/1 with valid data creates a city" do
#       assert {:ok, %City{} = city} = TimeZones.create_city(@valid_attrs)
#       assert city.city_name == "some city_name"
#       assert city.is_selected == true
#       assert city.time_zone == "some time_zone"
#     end
#
#     test "create_city/1 with invalid data returns error changeset" do
#       assert {:error, %Ecto.Changeset{}} = TimeZones.create_city(@invalid_attrs)
#     end
#
#     test "update_city/2 with valid data updates the city" do
#       city = city_fixture()
#       assert {:ok, %City{} = city} = TimeZones.update_city(city, @update_attrs)
#       assert city.city_name == "some updated city_name"
#       assert city.is_selected == false
#       assert city.time_zone == "some updated time_zone"
#     end
#
#     test "update_city/2 with invalid data returns error changeset" do
#       city = city_fixture()
#       assert {:error, %Ecto.Changeset{}} = TimeZones.update_city(city, @invalid_attrs)
#       assert city == TimeZones.get_city!(city.id)
#     end
#
#     test "delete_city/1 deletes the city" do
#       city = city_fixture()
#       assert {:ok, %City{}} = TimeZones.delete_city(city)
#       assert_raise Ecto.NoResultsError, fn -> TimeZones.get_city!(city.id) end
#     end
#
#     test "change_city/1 returns a city changeset" do
#       city = city_fixture()
#       assert %Ecto.Changeset{} = TimeZones.change_city(city)
#     end
#   end
# end
