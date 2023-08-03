defmodule XClarityWeb.ClientLive.Index do
  use XClarityWeb, :live_view

  alias XClarity.Clients
  alias XClarity.Clients.Client

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :clients, Clients.list_clients())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Client")
    |> assign(:client, Clients.get_client!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Client")
    |> assign(:client, %Client{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Clients")
    |> assign(:client, nil)
  end

  @impl true
  def handle_info({XClarityWeb.ClientLive.FormComponent, {:saved, client}}, socket) do
    {:noreply, stream_insert(socket, :clients, client)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    client = Clients.get_client!(id)
    {:ok, _} = Clients.delete_client(client)

    {:noreply, stream_delete(socket, :clients, client)}
  end
end
