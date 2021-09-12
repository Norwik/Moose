# Copyright 2022 Clivern. All rights reserved.
# Use of this source code is governed by the MIT
# license that can be found in the LICENSE file.

defmodule Cain.Repo.Migrations.CreateMessageMeta do
  use Ecto.Migration

  def change do
    create table(:message_meta) do
      add :key, :string
      add :value, :text
      add :message_id, references(:message, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:message_meta, [:key])
    create index(:message_meta, [:message_id])
  end
end
