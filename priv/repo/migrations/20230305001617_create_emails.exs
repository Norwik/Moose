# Copyright 2022 Clivern. All rights reserved.
# Use of this source code is governed by the MIT
# license that can be found in the LICENSE file.

defmodule Moose.Repo.Migrations.CreateEmails do
  use Ecto.Migration

  def change do
    create table(:emails) do
      add :uuid, :uuid
      add :email, :string, unique: true
      add :domain_id, references(:domains, on_delete: :delete_all), null: false
      add :expire, :boolean, default: true
      add :expire_at, :utc_datetime

      timestamps()
    end

    create index(:emails, [:uuid])
    create index(:emails, [:email])
  end
end
