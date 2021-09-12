# Copyright 2022 Clivern. All rights reserved.
# Use of this source code is governed by the MIT
# license that can be found in the LICENSE file.

defmodule Cain.Message do
  use Ecto.Schema
  import Ecto.Changeset

  schema "message" do
    field :content, :string
    field :status, :string

    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:content, :status])
    |> validate_required([:content, :status])
  end
end
