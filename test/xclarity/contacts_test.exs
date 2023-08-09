defmodule XClarity.ContactsTest do
  use XClarity.DataCase

  alias XClarity.Contacts

  describe "contacts" do
    alias XClarity.Contacts.Contact

    import XClarity.ContactsFixtures
    import XClarity.ClientsFixtures

    @invalid_attrs %{email: nil, first_name: nil, last_name: nil, phone: nil, responsibility: nil}

    test "list_contacts/0 returns all contacts" do
      contact = contact_fixture()
      assert Contacts.list_contacts() == [contact]
    end

    test "get_contact!/1 returns the contact with given id" do
      contact = contact_fixture()
      assert Contacts.get_contact!(contact.id) == contact
    end

    test "create_contact/1 with valid data creates a contact" do
      client = client_fixture()

      valid_attrs = %{
        email: "some email",
        first_name: "some first_name",
        last_name: "some last_name",
        phone: "some phone",
        responsibility: "some responsibility",
        client_id: client.id
      }

      assert {:ok, %Contact{} = contact} = Contacts.create_contact(valid_attrs)
      assert contact.email == "some email"
      assert contact.first_name == "some first_name"
      assert contact.last_name == "some last_name"
      assert contact.phone == "some phone"
      assert contact.responsibility == "some responsibility"
    end

    test "create_contact/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Contacts.create_contact(@invalid_attrs)
    end

    test "update_contact/2 with valid data updates the contact" do
      contact = contact_fixture()

      update_attrs = %{
        email: "some updated email",
        first_name: "some updated first_name",
        last_name: "some updated last_name",
        phone: "some updated phone",
        responsibility: "some updated responsibility"
      }

      assert {:ok, %Contact{} = contact} = Contacts.update_contact(contact, update_attrs)
      assert contact.email == "some updated email"
      assert contact.first_name == "some updated first_name"
      assert contact.last_name == "some updated last_name"
      assert contact.phone == "some updated phone"
      assert contact.responsibility == "some updated responsibility"
    end

    test "update_contact/2 with invalid data returns error changeset" do
      contact = contact_fixture()
      assert {:error, %Ecto.Changeset{}} = Contacts.update_contact(contact, @invalid_attrs)
      assert contact == Contacts.get_contact!(contact.id)
    end

    test "delete_contact/1 deletes the contact" do
      contact = contact_fixture()
      assert {:ok, %Contact{}} = Contacts.delete_contact(contact)
      assert_raise Ecto.NoResultsError, fn -> Contacts.get_contact!(contact.id) end
    end

    test "change_contact/1 returns a contact changeset" do
      contact = contact_fixture()
      assert %Ecto.Changeset{} = Contacts.change_contact(contact)
    end
  end
end
