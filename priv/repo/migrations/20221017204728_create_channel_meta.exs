# Copyright 2022 Clivern. All rights reserved.
# Use of this source code is governed by the MIT
# license that can be found in the LICENSE file.

defmodule Cain.Repo.Migrations.CreateChannelMeta do
  use Ecto.Migration

  def change do
    create table(:channel_meta) do
      add :key, :string
      add :value, :text
      add :channel_id, references(:channel, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:channel_meta, [:key])
    create index(:channel_meta, [:channel_id])
  end
end
