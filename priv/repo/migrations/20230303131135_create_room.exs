# Copyright 2022 Clivern. All rights reserved.
# Use of this source code is governed by the MIT
# license that can be found in the LICENSE file.

defmodule Chat.Repo.Migrations.CreateRoom do
  use Ecto.Migration

  def change do
    create table(:room) do
      add :name, :string
      add :uuid, :string
      add :slug, :string
      add :icon, :string
      add :is_private, :boolean, default: false
      add :country, :string, null: true
      add :state, :string, null: true
      add :user_id, references(:user, on_delete: :delete_all), null: true
      add :client_id, references(:client, on_delete: :delete_all), null: true

      timestamps()
    end

    create index(:room, [:uuid])
    create index(:room, [:slug])
    create index(:room, [:user_id])
    create index(:room, [:client_id])
  end
end
