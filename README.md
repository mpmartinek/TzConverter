# TzConverter

A simple Timezone Converter app. Allows you to add cities to your list of time zones and live convert the time for you. The list of cities is saved in a postgres DB, and your selection of cities is written right in the DB. Each instance of this app is intended for one user only. The ecto setup contains a seed with a couple dozen cities. If you'd like to add more, you can simply expand the seed (/priv/repo/seeds.exs) list following the same format. Use Tzdata.zone_list() inside iex to get a list of compatible cities (I've pre-exported it for you in /cities), as some cities are not considered 'time zone cities'. If you'd still like to add your own city to the Timezone Converter app, you can simply enter your city name into :city_name, and then enter the nearest time zone city into :time_zone. Enjoy!


This project was built with:
- Elixir 1.11.2
- Phoenix 1.5.6
- LiveView 0.14.8
- Python 2.7.18
- Nodejs 16


## Instructions

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `npm install` inside the `assets` directory
  * Start Phoenix endpoint with `mix phx.server`
  * Run test with `mix test`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.


Special thanks to:

lau/tzdata: https://github.com/lau/tzdata

lau/calendar: https://github.com/lau/calendar


## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix

## Screenshot

![alt text](/assets/images/demo1.png)
