defmodule XClarityWeb.ContactLive.Index do
  use XClarityWeb, :live_view

  alias XClarity.Contacts

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :contacts, Contacts.list_contacts())}
  end
end
