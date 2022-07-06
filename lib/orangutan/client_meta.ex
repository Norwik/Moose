# Copyright 2022 Clivern. All rights reserved.
# Use of this source code is governed by the MIT
# license that can be found in the LICENSE file.

defmodule Orangutan.ClientMeta do
  use Ecto.Schema
  import Ecto.Changeset

  schema "clients_meta" do
    field :key, :string
    field :value, :string
    field :client_id, :id

    timestamps()
  end

  @doc false
  def changeset(client_meta, attrs) do
    client_meta
    |> cast(attrs, [:key, :value])
    |> validate_required([:key, :value])
  end
end
