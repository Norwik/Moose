# Copyright 2022 Clivern. All rights reserved.
# Use of this source code is governed by the MIT
# license that can be found in the LICENSE file.

defmodule Chat.Channel do
  use Ecto.Schema
  # import Ecto.Changeset

  schema "channel" do
    field :uuid, :string
    field :first_user_id, :id
    field :second_user_id, :id

    timestamps()
  end
end
