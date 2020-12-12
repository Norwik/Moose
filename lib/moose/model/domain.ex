# Copyright 2022 Clivern. All rights reserved.
# Use of this source code is governed by the MIT
# license that can be found in the LICENSE file.

defmodule Moose.Model.Domain do
  @moduledoc """
  Domain Model
  """

  use Ecto.Schema
  import Ecto.Changeset

  schema "domains" do
    field :uuid, Ecto.UUID
    field :domain, :string
    field :verified, :boolean, default: false
    field :public, :boolean, default: false
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(domain, attrs) do
    domain
    |> cast(attrs, [
      :uuid,
      :domain,
      :verified,
      :public,
      :user_id
    ])
    |> validate_required([
      :uuid,
      :domain,
      :verified,
      :public,
      :user_id
    ])
  end
end
