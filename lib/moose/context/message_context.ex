# Copyright 2022 Clivern. All rights reserved.
# Use of this source code is governed by the MIT
# license that can be found in the LICENSE file.

defmodule Moose.Context.MessageContext do
  @moduledoc """
  Message Context Module
  """

  import Ecto.Query
  alias Moose.Repo
  alias Moose.Model.{MessageMeta, Message}

  @doc """
  Get a new Message
  """
  def message(message \\ %{}) do
    %{
      from: message.from,
      subject: message.subject,
      content: message.content,
      email_id: message.email_id,
      uuid: Ecto.UUID.generate()
    }
  end

  @doc """
  Get a Message Meta
  """
  def meta(meta \\ %{}) do
    %{
      key: meta.key,
      value: meta.value,
      message_id: meta.message_id
    }
  end

  @doc """
  Create a new Message
  """
  def create_message(attrs \\ %{}) do
    %Message{}
    |> Message.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Retrieve a Message by ID
  """
  def get_message_by_id(id) do
    Repo.get(Message, id)
  end

  @doc """
  Get Message by UUID
  """
  def get_message_by_uuid(uuid) do
    from(
      m in Message,
      where: m.uuid == ^uuid
    )
    |> Repo.one()
  end

  @doc """
  Update a Message
  """
  def update_message(message, attrs) do
    message
    |> Message.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Delete a Message
  """
  def delete_message(message) do
    Repo.delete(message)
  end

  @doc """
  Retrieve all Messages
  """
  def get_messages() do
    Repo.all(Message)
  end

  @doc """
  Retrieve Messages
  """
  def get_messages(offset, limit) do
    from(m in Message,
      where: m.limit == ^limit,
      where: m.offset == ^offset
    )
    |> Repo.all()
  end

  @doc """
  Count all Messages
  """
  def count_messages() do
    from(m in Message,
      select: count(m.id)
    )
    |> Repo.one()
  end

  @doc """
  Create a new Message Meta
  """
  def create_meta(attrs \\ %{}) do
    %MessageMeta{}
    |> MessageMeta.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Retrieve a Message Meta by ID
  """
  def get_meta_by_id(id) do
    Repo.get(MessageMeta, id)
  end

  @doc """
  Update a Message Meta
  """
  def update_meta(message_meta, attrs) do
    message_meta
    |> MessageMeta.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Delete a Message Meta
  """
  def delete_meta(message_meta) do
    Repo.delete(message_meta)
  end

  @doc """
  Get Meta by Message ID and key
  """
  def get_meta_by_message_id_key(message_id, meta_key) do
    from(
      m in MessageMeta,
      where: m.message_id == ^message_id,
      where: m.key == ^meta_key
    )
    |> Repo.one()
  end

  @doc """
  Get Message Metas
  """
  def get_message_metas(message_id) do
    from(
      m in MessageMeta,
      where: m.message_id == ^message_id
    )
    |> Repo.all()
  end

  @doc """
  Validate Message ID
  """
  def validate_message_id(message_id) do
    message = Repo.get(Message, message_id)

    case message do
      nil ->
        false

      _ ->
        true
    end
  end
end
