defmodule XClarity.Repo.Migrations.CreateContacts do
  use Ecto.Migration

  def change do
    create table(:contacts, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :first_name, :string
      add :last_name, :string
      add :responsibility, :string
      add :email, :string
      add :phone, :string
      add :client_id, references(:clients, on_delete: :delete_all, type: :binary_id)

      timestamps()
    end

    create index(:contacts, [:client_id])
  end
end
