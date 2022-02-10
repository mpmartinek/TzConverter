# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :tz_converter,
  ecto_repos: [TzConverter.Repo]

# Configures the endpoint
config :tz_converter, TzConverterWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Z1wYDLWgl3fKlcGHkUOFMQWFCKelMC9xSL1/F/X13R6L8tGaU7CaEjm3J7LZ90KZ",
  render_errors: [view: TzConverterWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: TzConverter.PubSub,
  live_view: [signing_salt: "dcJOhEzm"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Configure Tzdata to be used by Elixir globally
config :elixir, :time_zone_database, Tzdata.TimeZoneDatabase

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
