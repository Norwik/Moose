# Copyright 2022 Clivern. All rights reserved.
# Use of this source code is governed by the MIT
# license that can be found in the LICENSE file.

defmodule Chat.Client do
  use Ecto.Schema
  import Ecto.Changeset

  schema "client" do
    field :secret, :string
    field :uuid, :string

    timestamps()
  end

  @doc false
  def changeset(client, attrs) do
    client
    |> cast(attrs, [:uuid, :secret])
    |> validate_required([:uuid, :secret])
  end
end
