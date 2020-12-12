# Copyright 2022 Clivern. All rights reserved.
# Use of this source code is governed by the MIT
# license that can be found in the LICENSE file.

defmodule Moose.Model.EmailMeta do
  @moduledoc """
  EmailMeta Model
  """

  use Ecto.Schema
  import Ecto.Changeset

  schema "emails_meta" do
    field :key, :string
    field :value, :string
    field :email_id, :id

    timestamps()
  end

  @doc false
  def changeset(email_meta, attrs) do
    email_meta
    |> cast(attrs, [
      :key,
      :value,
      :email_id
    ])
    |> validate_required([
      :key,
      :value,
      :email_id
    ])
  end
end
