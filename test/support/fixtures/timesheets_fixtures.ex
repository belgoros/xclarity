defmodule XClarity.TimesheetsFixtures do
  XClarity.AccountsFixtures

  @moduledoc """
  This module defines test helpers for creating
  entities via the `XClarity.Timesheets` context.
  """

  @doc """
  Generate a timesheet.
  """
  def timesheet_fixture(attrs \\ %{}) do
    user = XClarity.AccountsFixtures.user_fixture()

    {:ok, timesheet} =
      attrs
      |> Enum.into(%{
        status: :open,
        user_id: user.id
      })
      |> XClarity.Timesheets.create_timesheet()

    timesheet
  end
end
