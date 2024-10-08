defmodule Piet.Workspace.Project do
  use Ecto.Schema
  import Ecto.Changeset

  schema "projects" do
    field :name, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(project, attrs) do
    project
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
