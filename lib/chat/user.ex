# Copyright 2022 Clivern. All rights reserved.
# Use of this source code is governed by the MIT
# license that can be found in the LICENSE file.

defmodule Chat.User do
  use Ecto.Schema
  # import Ecto.Changeset

  schema "user" do
    field :key, :string
    field :value, :string
    field :client_id, :id

    timestamps()
  end
end
