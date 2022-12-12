# Copyright 2022 Clivern. All rights reserved.
# Use of this source code is governed by the MIT
# license that can be found in the LICENSE file.

defmodule Orangutan.Repo.Migrations.CreateDomainsMeta do
  use Ecto.Migration

  def change do
    create table(:domains_meta) do
      add :key, :string
      add :value, :text
      add :domain_id, references(:domains, on_delete: :delete_all)

      timestamps()
    end

    create index(:domains_meta, [:key])
    create index(:domains_meta, [:domain_id])
  end
end
