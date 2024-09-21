defmodule JanusExample.Repo do
  use Ecto.Repo,
    otp_app: :janus_example,
    adapter: Ecto.Adapters.SQLite3
end
