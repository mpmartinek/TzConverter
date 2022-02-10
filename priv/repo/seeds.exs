# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     TzConverter.Repo.insert!(%TzConverter.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

TzConverter.Repo.insert!(%TzConverter.TimeZones.City{
  city_name: "Prague",
  time_zone: "Europe/Prague",
  is_selected: false
})

TzConverter.Repo.insert!(%TzConverter.TimeZones.City{
  city_name: "Paris",
  time_zone: "Europe/Paris",
  is_selected: false
})

TzConverter.Repo.insert!(%TzConverter.TimeZones.City{
  city_name: "Berlin",
  time_zone: "Europe/Berlin",
  is_selected: false
})

TzConverter.Repo.insert!(%TzConverter.TimeZones.City{
  city_name: "Hamburg",
  time_zone: "Europe/Berlin",
  is_selected: false
})

TzConverter.Repo.insert!(%TzConverter.TimeZones.City{
  city_name: "New York",
  time_zone: "America/New_York",
  is_selected: false
})

TzConverter.Repo.insert!(%TzConverter.TimeZones.City{
  city_name: "Los Angeles",
  time_zone: "America/Los_Angeles",
  is_selected: false
})

TzConverter.Repo.insert!(%TzConverter.TimeZones.City{
  city_name: "El Salvador",
  time_zone: "America/El_Salvador",
  is_selected: false
})

TzConverter.Repo.insert!(%TzConverter.TimeZones.City{
  city_name: "Seoul",
  time_zone: "Asia/Seoul",
  is_selected: false
})

TzConverter.Repo.insert!(%TzConverter.TimeZones.City{
  city_name: "Tokyo",
  time_zone: "Asia/Tokyo",
  is_selected: false
})

TzConverter.Repo.insert!(%TzConverter.TimeZones.City{
  city_name: "Brno",
  time_zone: "Europe/Prague",
  is_selected: false
})

TzConverter.Repo.insert!(%TzConverter.TimeZones.City{
  city_name: "Kiev",
  time_zone: "Europe/Kiev",
  is_selected: false
})

TzConverter.Repo.insert!(%TzConverter.TimeZones.City{
  city_name: "Athens",
  time_zone: "Europe/Athens",
  is_selected: false
})

TzConverter.Repo.insert!(%TzConverter.TimeZones.City{
  city_name: "Riga",
  time_zone: "Europe/Riga",
  is_selected: false
})

TzConverter.Repo.insert!(%TzConverter.TimeZones.City{
  city_name: "Stockholm",
  time_zone: "Europe/Stockholm",
  is_selected: false
})

TzConverter.Repo.insert!(%TzConverter.TimeZones.City{
  city_name: "Warsaw",
  time_zone: "Europe/Warsaw",
  is_selected: false
})

TzConverter.Repo.insert!(%TzConverter.TimeZones.City{
  city_name: "Brussels",
  time_zone: "Europe/Brussels",
  is_selected: false
})

TzConverter.Repo.insert!(%TzConverter.TimeZones.City{
  city_name: "Moscow",
  time_zone: "Europe/Moscow",
  is_selected: false
})

TzConverter.Repo.insert!(%TzConverter.TimeZones.City{
  city_name: "Dublin",
  time_zone: "Europe/Dublin",
  is_selected: false
})

TzConverter.Repo.insert!(%TzConverter.TimeZones.City{
  city_name: "Rome",
  time_zone: "Europe/Rome",
  is_selected: false
})

TzConverter.Repo.insert!(%TzConverter.TimeZones.City{
  city_name: "Fiji",
  time_zone: "Pacific/Fiji",
  is_selected: false
})

TzConverter.Repo.insert!(%TzConverter.TimeZones.City{
  city_name: "Guam",
  time_zone: "Pacific/Guam",
  is_selected: false
})

TzConverter.Repo.insert!(%TzConverter.TimeZones.City{
  city_name: "Honolulu",
  time_zone: "Pacific/Honolulu",
  is_selected: false
})

TzConverter.Repo.insert!(%TzConverter.TimeZones.City{
  city_name: "Pago Pago",
  time_zone: "Pacific/Pago_Pago",
  is_selected: false
})

TzConverter.Repo.insert!(%TzConverter.TimeZones.City{
  city_name: "Midway",
  time_zone: "Pacific/Midway",
  is_selected: false
})

TzConverter.Repo.insert!(%TzConverter.TimeZones.City{
  city_name: "Pyongyang",
  time_zone: "Asia/Pyongyang",
  is_selected: false
})

TzConverter.Repo.insert!(%TzConverter.TimeZones.City{
  city_name: "Qatar",
  time_zone: "Asia/Qatar",
  is_selected: false
})

TzConverter.Repo.insert!(%TzConverter.TimeZones.City{
  city_name: "Shanghai",
  time_zone: "Asia/Shanghai",
  is_selected: false
})

TzConverter.Repo.insert!(%TzConverter.TimeZones.City{
  city_name: "Saigon",
  time_zone: "Asia/Saigon",
  is_selected: false
})

TzConverter.Repo.insert!(%TzConverter.TimeZones.City{
  city_name: "Singapore",
  time_zone: "Asia/Singapore",
  is_selected: false
})

TzConverter.Repo.insert!(%TzConverter.TimeZones.City{
  city_name: "Tel Aviv",
  time_zone: "Asia/Tel_Aviv",
  is_selected: false
})

TzConverter.Repo.insert!(%TzConverter.TimeZones.City{
  city_name: "Lagos",
  time_zone: "Africa/Lagos",
  is_selected: false
})

TzConverter.Repo.insert!(%TzConverter.TimeZones.City{
  city_name: "Nairobi",
  time_zone: "Africa/Nairobi",
  is_selected: false
})

TzConverter.Repo.insert!(%TzConverter.TimeZones.City{
  city_name: "Asmara",
  time_zone: "Africa/Asmara",
  is_selected: false
})

TzConverter.Repo.insert!(%TzConverter.TimeZones.City{
  city_name: "Brazzaville",
  time_zone: "Africa/Brazzaville",
  is_selected: false
})
