defmodule XClarity.TimesheetsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `XClarity.Timesheets` context.
  """

  @doc """
  Generate a timesheet.
  """
  def timesheet_fixture(attrs \\ %{}) do
    {:ok, timesheet} =
      attrs
      |> Enum.into(%{
        status: "some status"
      })
      |> XClarity.Timesheets.create_timesheet()

    timesheet
  end
end
