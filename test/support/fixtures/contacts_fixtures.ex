defmodule XClarity.ContactsFixtures do
  import XClarity.ClientsFixtures

  @moduledoc """
  This module defines test helpers for creating
  entities via the `XClarity.Contacts` context.
  """

  @doc """
  Generate a contact.
  """
  def contact_fixture(attrs \\ %{}) do
    client = client_fixture()

    {:ok, contact} =
      attrs
      |> Enum.into(%{
        email: Faker.Internet.email(),
        first_name: Faker.Person.first_name(),
        last_name: Faker.Person.last_name(),
        phone: Faker.Phone.EnUs.phone(),
        responsibility: Faker.Person.name(),
        client_id: client.id
      })
      |> XClarity.Contacts.create_contact()

    contact
  end
end
