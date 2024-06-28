defmodule Piet.Repo do
  use Ecto.Repo,
    otp_app: :piet,
    adapter: Ecto.Adapters.Postgres
end
