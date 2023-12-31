defmodule XClarity.Clients.Client do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "clients" do
    field :name, :string
    field :vat, :string
    has_many :contacts, XClarity.Contacts.Contact

    timestamps()
  end

  @doc false
  def changeset(client, attrs) do
    client
    |> cast(attrs, [:name, :vat])
    |> validate_required([:name, :vat])
  end
end
