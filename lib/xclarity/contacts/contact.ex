defmodule XClarity.Contacts.Contact do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "contacts" do
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :phone, :string
    field :responsibility, :string
    belongs_to :client, XClarity.Clients.Client

    timestamps()
  end

  @doc false
  def changeset(contact, attrs) do
    contact
    |> cast(attrs, [:first_name, :last_name, :responsibility, :email, :phone, :client_id])
    |> validate_required([:first_name, :last_name, :responsibility, :email, :phone, :client_id])
  end
end
