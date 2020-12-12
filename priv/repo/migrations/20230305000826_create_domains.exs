# Copyright 2022 Clivern. All rights reserved.
# Use of this source code is governed by the MIT
# license that can be found in the LICENSE file.

defmodule Moose.Repo.Migrations.CreateDomains do
  use Ecto.Migration

  def change do
    create table(:domains) do
      add :uuid, :uuid
      add :domain, :string, unique: true
      add :verified, :boolean, default: false
      add :public, :boolean, default: false
      add :user_id, references(:users, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:domains, [:uuid])
    create index(:domains, [:domain])
  end
end
