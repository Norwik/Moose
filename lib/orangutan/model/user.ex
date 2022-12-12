# Copyright 2022 Clivern. All rights reserved.
# Use of this source code is governed by the MIT
# license that can be found in the LICENSE file.

defmodule Orangutan.Model.User do
  @moduledoc """
  User Model
  """

  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :uuid, Ecto.UUID
    field :name, :string
    field :email, :string
    field :password_hash, :string
    field :verified, :boolean, default: false
    field :role, :string
    field :last_seen, :utc_datetime

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [
      :uuid,
      :name,
      :email,
      :password_hash,
      :verified,
      :role,
      :last_seen
    ])
    |> validate_required([
      :uuid,
      :name,
      :email,
      :password_hash,
      :verified,
      :role,
      :last_seen
    ])
    |> validate_length(:name, min: 3, max: 60)
    |> validate_length(:email, min: 3, max: 60)
    |> validate_subset(:role, ["regular", "admin"])
  end
end
