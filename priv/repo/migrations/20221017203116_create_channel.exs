# Copyright 2022 Clivern. All rights reserved.
# Use of this source code is governed by the MIT
# license that can be found in the LICENSE file.

defmodule Chat.Repo.Migrations.CreateChannel do
  use Ecto.Migration

  def change do
    create table(:channel) do
      add :uuid, :string
      add :first_user_id, references(:user, on_delete: :delete_all), null: false
      add :second_user_id, references(:user, on_delete: :delete_all), null: false

      timestamps()
    end
  end
end
