defmodule XClarityWeb.TimesheetLive.Index do
  use XClarityWeb, :live_view

  alias XClarity.Timesheets

  @impl true
  def mount(_params, _session, socket) do
    user_id = socket.assigns.current_user.id
    {:ok, stream(socket, :timesheets, Timesheets.list_timesheets_by_user_id(user_id))}
  end
end
