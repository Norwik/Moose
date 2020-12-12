# Copyright 2022 Clivern. All rights reserved.
# Use of this source code is governed by the MIT
# license that can be found in the LICENSE file.

defmodule Orangutan.Model.Message do
  @moduledoc """
  Message Model
  """

  use Ecto.Schema
  import Ecto.Changeset

  schema "messages" do
    field :uuid, Ecto.UUID
    field :from, :string
    field :subject, :string
    field :content, :string
    field :email_id, :id

    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [
      :uuid,
      :from,
      :subject,
      :content,
      :email_id
    ])
    |> validate_required([
      :uuid,
      :from,
      :subject,
      :content,
      :email_id
    ])
  end
end
