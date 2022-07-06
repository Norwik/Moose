# Copyright 2022 Clivern. All rights reserved.
# Use of this source code is governed by the MIT
# license that can be found in the LICENSE file.

defmodule Chat.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :username, :string, null: false, unique: true
      add :email, :string, null: false, unique: true
      add :password_hash, :string, null: false
      add :verified, :boolean, default: false
      add :gender, :string, null: false, default: "male"
      add :country, :string, null: false, default: "united_states"
      add :state, :string, null: false, default: "alabama"
      add :age, :integer, null: false
      add :last_seen, :utc_datetime, null: false

      timestamps()
    end

    create index(:users, [:username])
    create index(:users, [:email])
  end
end
