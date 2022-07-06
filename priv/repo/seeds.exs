# Copyright 2022 Clivern. All rights reserved.
# Use of this source code is governed by the MIT
# license that can be found in the LICENSE file.

# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Orangutan.Repo.insert!(%Orangutan.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

user_data = %{
  name: "John Smith",
  username: "john_smith",
  email: "john_smith@example.com",
  password_hash: "hashed_password",
  verified: false,
  gender: "male",
  country: "USA",
  state: "CA",
  age: 30,
  last_seen: DateTime.utc_now()
}

changeset = Orangutan.User.changeset(%Orangutan.User{}, user_data)

case Orangutan.Repo.insert(changeset) do
  {:ok, user} -> IO.puts inspect(user)
  {:error, changeset} -> IO.puts inspect(changeset)
end
