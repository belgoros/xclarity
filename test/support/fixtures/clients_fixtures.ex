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
        name: Faker.Company.name(),
        vat: Faker.Code.isbn()
      })
      |> XClarity.Clients.create_client()

    client
  end
end
