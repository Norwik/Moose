# Copyright 2022 Clivern. All rights reserved.
# Use of this source code is governed by the MIT
# license that can be found in the LICENSE file.

defmodule Chat.Repo.Migrations.CreateChannel do
  use Ecto.Migration

  def change do
    create table(:channel) do
      add :title, :string
      add :type, :string

      timestamps()
    end
  end
end
