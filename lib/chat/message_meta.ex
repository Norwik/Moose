# Copyright 2022 Clivern. All rights reserved.
# Use of this source code is governed by the MIT
# license that can be found in the LICENSE file.

defmodule Chat.MessageMeta do
  use Ecto.Schema
  import Ecto.Changeset

  schema "message_meta" do
    field :key, :string
    field :value, :string
    field :message_id, :id

    timestamps()
  end

  @doc false
  def changeset(message_meta, attrs) do
    message_meta
    |> cast(attrs, [:key, :value])
    |> validate_required([:key, :value])
  end
end
