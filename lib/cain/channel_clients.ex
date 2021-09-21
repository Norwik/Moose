# Copyright 2022 Clivern. All rights reserved.
# Use of this source code is governed by the MIT
# license that can be found in the LICENSE file.

defmodule Cain.ChannelClients do
  use Ecto.Schema
  import Ecto.Changeset

  schema "channel_clients" do
    field :channel_id, :id
    field :client_id, :id

    timestamps()
  end

  @doc false
  def changeset(channel_clients, attrs) do
    channel_clients
    |> cast(attrs, [])
    |> validate_required([])
  end
end
