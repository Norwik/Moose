# Copyright 2022 Clivern. All rights reserved.
# Use of this source code is governed by the MIT
# license that can be found in the LICENSE file.

defmodule Cain.Repo.Migrations.AddChannelClients do
  use Ecto.Migration

  def change do
    create table(:channel_clients) do
      add :channel_id, references(:channel, on_delete: :delete_all), null: false
      add :client_id, references(:client, on_delete: :delete_all), null: false
      timestamps()
    end
    create index(:channel_clients, [:channel_id, :client_id])
  end
end
