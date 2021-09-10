defmodule Cain.Repo do
  use Ecto.Repo,
    otp_app: :cain,
    adapter: Ecto.Adapters.Postgres
end
