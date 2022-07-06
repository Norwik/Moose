# Copyright 2022 Clivern. All rights reserved.
# Use of this source code is governed by the MIT
# license that can be found in the LICENSE file.

defmodule Chat.Repo.Migrations.CreateRoomMeta do
  use Ecto.Migration

  def change do
    create table(:room_meta) do
      add :key, :string
      add :value, :text
      add :room_id, references(:room, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:room_meta, [:key])
    create index(:room_meta, [:room_id])
  end
end
