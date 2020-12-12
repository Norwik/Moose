# Copyright 2022 Clivern. All rights reserved.
# Use of this source code is governed by the MIT
# license that can be found in the LICENSE file.

defmodule Moose.Model.DomainMeta do
  @moduledoc """
  DomainMeta Model
  """

  use Ecto.Schema
  import Ecto.Changeset

  schema "domains_meta" do
    field :key, :string
    field :value, :string
    field :domain_id, :id

    timestamps()
  end

  @doc false
  def changeset(domain_meta, attrs) do
    domain_meta
    |> cast(attrs, [
      :key,
      :value,
      :domain_id
    ])
    |> validate_required([
      :key,
      :value,
      :domain_id
    ])
  end
end
