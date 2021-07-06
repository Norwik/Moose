# Copyright 2022 Clivern. All rights reserved.
# Use of this source code is governed by the MIT
# license that can be found in the LICENSE file.

defmodule Chat.Repo.Migrations.CreateClientMeta do
  use Ecto.Migration

  def change do
    create table(:client_meta) do
      add :key, :string
      add :value, :text
      add :client_id, references(:client, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:client_meta, [:key])
    create index(:client_meta, [:client_id])
  end
end
