# Copyright 2022 Clivern. All rights reserved.
# Use of this source code is governed by the MIT
# license that can be found in the LICENSE file.

defmodule Orangutan.Model.Client do
  use Ecto.Schema
  import Ecto.Changeset

  schema "clients" do
    field :age, :integer
    field :country, :string
    field :gender, :string
    field :last_seen, :utc_datetime
    field :secret, :string
    field :state, :string
    field :username, :string
    field :uuid, Ecto.UUID
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(client, attrs) do
    client
    |> cast(attrs, [
      :uuid,
      :secret,
      :username,
      :gender,
      :country,
      :state,
      :age,
      :last_seen,
      :user_id
    ])
    |> validate_required([
      :uuid,
      :secret,
      :username,
      :gender,
      :country,
      :state,
      :age,
      :last_seen
    ])
  end
end
