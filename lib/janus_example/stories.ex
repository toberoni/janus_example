defmodule JanusExample.Stories do
  require Logger

  alias JanusExample.Repo
  import Ecto.Query, warn: false

  alias JanusExample.Stories.Story
  alias JanusExample.Policy

  def list_stories do
    Repo.all(Story)
  end

  def list_public_stories() do
    user = nil

    public_stories_query()
    |> all_authorized_stories(user)
  end

  defp public_stories_query() do
    from s in Story, where: s.status == :public
  end

  defp all_authorized_stories(query, user) do
    Policy.authorized_fetch_all(query, authorize: {:read, user})
  end

  def fetch_one(uuid) do
    user = nil

    query =
      from s in Story,
        where: s.uuid == ^uuid

    Policy.authorized_fetch_one(query, authorize: {:read, user})
    |> case do
      {:ok, story} -> story
      err -> err
    end
  end
end
