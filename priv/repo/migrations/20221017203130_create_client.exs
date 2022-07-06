# Copyright 2022 Clivern. All rights reserved.
# Use of this source code is governed by the MIT
# license that can be found in the LICENSE file.

defmodule Chat.Repo.Migrations.CreateClient do
  use Ecto.Migration

  def change do
    create table(:client) do
      add :uuid, :string
      add :secret, :string
      add :username, :string, null: false, unique: true
      add :gender, :string, null: false, default: "male"
      add :country, :string, null: false, default: "united_states"
      add :state, :string, null: false, default: "alabama"
      add :age, :integer, null: false
      add :last_seen, :utc_datetime, null: false
      add :user_id, references(:user, on_delete: :delete_all), null: true

      timestamps()
    end

    create index(:client, [:uuid])
    create index(:client, [:secret])
    create index(:client, [:username])
    create index(:client, [:user_id])
  end
end
