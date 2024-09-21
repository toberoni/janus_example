defmodule JanusExample.Repo.Migrations.CreateStories do
  use Ecto.Migration

  def change do
    create table(:stories) do
      add :uuid, :string
      add :title, :string
      add :description, :string
      add :status, :string
      add :duration, :float
      add :kind, :string

      timestamps(type: :utc_datetime)
    end
  end
end
