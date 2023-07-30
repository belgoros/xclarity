defmodule XClarity.Timesheets.Timesheet do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "timesheets" do
    field :status, Ecto.Enum, values: [:open, :saved, :rejected, :approved]
    field(:user_id, :binary_id)

    timestamps()
  end

  @doc false
  def changeset(timesheet, attrs) do
    timesheet
    |> cast(attrs, [:status, :user_id])
    |> validate_required([:status, :user_id])
  end
end
