defmodule XClarity.ClientsTest do
  use XClarity.DataCase

  alias XClarity.Clients

  describe "clients" do
    alias XClarity.Clients.Client

    import XClarity.ClientsFixtures

    @invalid_attrs %{name: nil, vat: nil}

    test "list_clients/0 returns all clients" do
      client = client_fixture()
      assert Clients.list_clients() == [client]
    end

    test "get_client!/1 returns the client with given id" do
      client = client_fixture()
      assert Clients.get_client!(client.id) == client
    end

    test "create_client/1 with valid data creates a client" do
      valid_attrs = %{name: "some name", vat: "some vat"}

      assert {:ok, %Client{} = client} = Clients.create_client(valid_attrs)
      assert client.name == "some name"
      assert client.vat == "some vat"
    end

    test "create_client/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Clients.create_client(@invalid_attrs)
    end

    test "update_client/2 with valid data updates the client" do
      client = client_fixture()
      update_attrs = %{name: "some updated name", vat: "some updated vat"}

      assert {:ok, %Client{} = client} = Clients.update_client(client, update_attrs)
      assert client.name == "some updated name"
      assert client.vat == "some updated vat"
    end

    test "update_client/2 with invalid data returns error changeset" do
      client = client_fixture()
      assert {:error, %Ecto.Changeset{}} = Clients.update_client(client, @invalid_attrs)
      assert client == Clients.get_client!(client.id)
    end

    test "delete_client/1 deletes the client" do
      client = client_fixture()
      assert {:ok, %Client{}} = Clients.delete_client(client)
      assert_raise Ecto.NoResultsError, fn -> Clients.get_client!(client.id) end
    end

    test "change_client/1 returns a client changeset" do
      client = client_fixture()
      assert %Ecto.Changeset{} = Clients.change_client(client)
    end
  end
end
