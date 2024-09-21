defmodule JanusExample.Stories.Story do
  use Ecto.Schema
  import Ecto.Changeset

  @valid_states [
    :created,
    :next_illustrations,
    :next_audio,
    :finished,
    :in_review,
    :public
  ]

  @cast_fields [
    :title,
    :description,
    :duration,
    :kind,
    :status
  ]

  @valid_kinds [:generated, :imported]

  schema "stories" do
    field :uuid, :string
    field :title, :string
    field :description, :string
    field :status, Ecto.Enum, values: @valid_states, default: :created
    field :kind, Ecto.Enum, values: @valid_kinds, default: :generated
    field :duration, :float

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(story, attrs) do
    story
    |> cast(attrs, @cast_fields)
  end
end
