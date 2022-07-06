# Copyright 2022 Clivern. All rights reserved.
# Use of this source code is governed by the MIT
# license that can be found in the LICENSE file.

defmodule Chat.Repo.Migrations.CreateMessage do
  use Ecto.Migration

  def change do
    create table(:message) do
      add :content, :text
      add :type, :string
      add :client_id, references(:client, on_delete: :delete_all), null: false
      add :room_id, references(:room, on_delete: :delete_all), null: true
      add :channel_id, references(:channel, on_delete: :delete_all), null: true

      timestamps()
    end
  end
end
