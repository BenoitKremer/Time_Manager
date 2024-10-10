defmodule Backend.Repo.Migrations.CreateTask do
  use Ecto.Migration

  def change do
    create table(:task) do
      add :tasks, :string
      add :title, :string
      add :description, :string
      add :status, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:task, [:user_id])
  end
end
