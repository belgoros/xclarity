defmodule XClarity.Repo.Migrations.CreateTimesheets do
  use Ecto.Migration

  def change do
    create table(:timesheets, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :status, :string, null: false, default: "open"
      add :user_id, references(:users, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:timesheets, [:user_id])
  end
end
