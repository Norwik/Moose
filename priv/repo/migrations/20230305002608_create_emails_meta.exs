# Copyright 2022 Clivern. All rights reserved.
# Use of this source code is governed by the MIT
# license that can be found in the LICENSE file.

defmodule Moose.Repo.Migrations.CreateEmailsMeta do
  use Ecto.Migration

  def change do
    create table(:emails_meta) do
      add :key, :string
      add :value, :text
      add :email_id, references(:emails, on_delete: :delete_all)

      timestamps()
    end

    create index(:emails_meta, [:key])
    create index(:emails_meta, [:email_id])
  end
end
