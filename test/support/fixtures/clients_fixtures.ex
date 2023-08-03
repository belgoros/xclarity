defmodule XClarity.ClientsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `XClarity.Clients` context.
  """

  @doc """
  Generate a client.
  """
  def client_fixture(attrs \\ %{}) do
    {:ok, client} =
      attrs
      |> Enum.into(%{
        name: "some name",
        vat: "some vat"
      })
      |> XClarity.Clients.create_client()

    client
  end
end
