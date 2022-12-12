# Copyright 2022 Clivern. All rights reserved.
# Use of this source code is governed by the MIT
# license that can be found in the LICENSE file.

defmodule Orangutan.Model.Email do
  @moduledoc """
  Email Model
  """

  use Ecto.Schema
  import Ecto.Changeset

  schema "emails" do
    field :uuid, Ecto.UUID
    field :email, :string
    field :domain_id, :id
    field :expire, :boolean, default: true
    field :expire_at, :utc_datetime

    timestamps()
  end

  @doc false
  def changeset(email, attrs) do
    email
    |> cast(attrs, [
      :uuid,
      :email,
      :domain_id,
      :expire,
      :expire_at
    ])
    |> validate_required([
      :uuid,
      :email,
      :domain_id,
      :expire,
      :expire_at
    ])
    |> validate_length(:email, min: 3, max: 60)
  end
end
