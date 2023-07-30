defmodule XClarity.TimesheetsTest do
  use XClarity.DataCase

  alias XClarity.Timesheets

  describe "timesheets" do
    alias XClarity.Timesheets.Timesheet

    import XClarity.TimesheetsFixtures
    import XClarity.AccountsFixtures

    @invalid_attrs %{status: nil}

    test "list_timesheets/0 returns all timesheets" do
      timesheet = timesheet_fixture()
      assert Timesheets.list_timesheets() == [timesheet]
    end

    test "get_timesheet!/1 returns the timesheet with given id" do
      timesheet = timesheet_fixture()
      assert Timesheets.get_timesheet!(timesheet.id) == timesheet
    end

    test "create_timesheet/1 with valid data creates a timesheet" do
      user = user_fixture()
      valid_attrs = %{status: :open, user_id: user.id}

      assert {:ok, %Timesheet{} = timesheet} = Timesheets.create_timesheet(valid_attrs)
      assert timesheet.status == :open
    end

    test "create_timesheet/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Timesheets.create_timesheet(@invalid_attrs)
    end

    test "update_timesheet/2 with valid data updates the timesheet" do
      timesheet = timesheet_fixture()
      update_attrs = %{status: :saved}

      assert {:ok, %Timesheet{} = timesheet} =
               Timesheets.update_timesheet(timesheet, update_attrs)

      assert timesheet.status == :saved
    end

    test "update_timesheet/2 with invalid data returns error changeset" do
      timesheet = timesheet_fixture()
      assert {:error, %Ecto.Changeset{}} = Timesheets.update_timesheet(timesheet, @invalid_attrs)
      assert timesheet == Timesheets.get_timesheet!(timesheet.id)
    end

    test "delete_timesheet/1 deletes the timesheet" do
      timesheet = timesheet_fixture()
      assert {:ok, %Timesheet{}} = Timesheets.delete_timesheet(timesheet)
      assert_raise Ecto.NoResultsError, fn -> Timesheets.get_timesheet!(timesheet.id) end
    end

    test "change_timesheet/1 returns a timesheet changeset" do
      timesheet = timesheet_fixture()
      assert %Ecto.Changeset{} = Timesheets.change_timesheet(timesheet)
    end
  end
end
