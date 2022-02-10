defmodule TzConverter.Repo do
  use Ecto.Repo,
    otp_app: :tz_converter,
    adapter: Ecto.Adapters.Postgres
end
