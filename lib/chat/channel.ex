# Copyright 2022 Clivern. All rights reserved.
# Use of this source code is governed by the MIT
# license that can be found in the LICENSE file.

defmodule Chat.Channel do
  use Ecto.Schema
  import Ecto.Changeset

  schema "channel" do
    field :title, :string
    field :type, :string

    timestamps()
  end

  @doc false
  def changeset(channel, attrs) do
    channel
    |> cast(attrs, [:title, :type])
    |> validate_required([:title, :type])
  end
end
