# Copyright 2022 Clivern. All rights reserved.
# Use of this source code is governed by the MIT
# license that can be found in the LICENSE file.

defmodule Moose.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :uuid, :uuid
      add :from, :string
      add :subject, :string
      add :content, :text
      add :email_id, references(:emails, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:messages, [:uuid])
    create index(:messages, [:email_id])
  end
end
