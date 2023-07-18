defmodule XClarity.Repo do
  use Ecto.Repo,
    otp_app: :xclarity,
    adapter: Ecto.Adapters.Postgres
end
