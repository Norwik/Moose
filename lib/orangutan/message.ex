# Copyright 2022 Clivern. All rights reserved.
# Use of this source code is governed by the MIT
# license that can be found in the LICENSE file.

defmodule Orangutan.Message do
  use Ecto.Schema
  import Ecto.Changeset

  schema "messages" do
    field :content, :string
    field :type, :string
    field :uuid, Ecto.UUID
    field :client_id, :id
    field :room_id, :id
    field :channel_id, :id

    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:content, :uuid, :type])
    |> validate_required([:content, :uuid, :type])
  end
end
