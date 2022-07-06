# Copyright 2022 Clivern. All rights reserved.
# Use of this source code is governed by the MIT
# license that can be found in the LICENSE file.

defmodule Orangutan.UserMeta do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users_meta" do
    field :key, :string
    field :value, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(user_meta, attrs) do
    user_meta
    |> cast(attrs, [:key, :value])
    |> validate_required([:key, :value])
  end
end
