# Copyright 2022 Clivern. All rights reserved.
# Use of this source code is governed by the MIT
# license that can be found in the LICENSE file.

# Message Context Module
defmodule Orangutan.Context.MessageContext do
  import Ecto.Query
  alias Orangutan.Repo
  alias Orangutan.Model.{MessageMeta, Message}

  # Get a message map
  def new_message(message \\ %{}) do
    %{
      content: message.content,
      type: message.type,
      client_id: message.client_id,
      channel_id: message.channel_id,
      room_id: message.room_id,
      uuid: Ecto.UUID.generate()
    }
  end

  # Get a message meta map
  def new_meta(meta \\ %{}) do
    %{
      key: meta.key,
      value: meta.value,
      message_id: meta.message_id
    }
  end

  # Create a new message
  def create_message(attrs \\ %{}) do
    %Message{}
    |> Message.changeset(attrs)
    |> Repo.insert()
  end

  # Count all messages
  def count_messages(channel_id, room_id) do
    case {channel_id, room_id} do
      {channel_id, room_id} when channel_id != "" and room_id != "" ->
        from(u in Message,
          select: count(u.id),
          where: u.channel_id == ^channel_id,
          where: u.room_id == ^room_id
        )
        |> Repo.one()

      {channel_id, room_id} when channel_id == "" and room_id == "" ->
        from(u in Message,
          select: count(u.id)
        )
        |> Repo.one()

      {channel_id, room_id} when channel_id != "" and room_id == "" ->
        from(u in Message,
          select: count(u.id),
          where: u.channel_id == ^channel_id
        )
        |> Repo.one()

      {channel_id, room_id} when channel_id == "" and room_id != "" ->
        from(u in Message,
          select: count(u.id),
          where: u.room_id == ^room_id
        )
        |> Repo.one()
    end
  end

  # Retrieve a message by ID
  def get_message_by_id(id) do
    Repo.get(Message, id)
  end

  # Get message by uuid
  def get_message_by_uuid(uuid) do
    from(
      u in Message,
      where: u.uuid == ^uuid
    )
    |> Repo.one()
  end

  # Update a message
  def update_message(message, attrs) do
    message
    |> Message.changeset(attrs)
    |> Repo.update()
  end

  # Delete a message
  def delete_message(message) do
    Repo.delete(message)
  end

  # Retrieve all messages
  def get_messages() do
    Repo.all(Message)
  end

  # Retrieve messages
  def get_messages(channel_id, room_id, offset, limit) do
    case {channel_id, room_id, offset, limit} do
      {channel_id, room_id, offset, limit} when channel_id != "" and room_id != "" ->
        from(u in Message,
          where: u.channel_id == ^channel_id,
          where: u.room_id == ^room_id,
          limit: ^limit,
          offset: ^offset
        )
        |> Repo.all()

      {channel_id, room_id, offset, limit} when channel_id == "" and room_id == "" ->
        from(u in Message,
          limit: ^limit,
          offset: ^offset
        )
        |> Repo.all()

      {channel_id, room_id, offset, limit} when channel_id != "" and room_id == "" ->
        from(u in Message,
          where: u.channel_id == ^channel_id,
          limit: ^limit,
          offset: ^offset
        )
        |> Repo.all()

      {channel_id, room_id, offset, limit} when channel_id == "" and room_id != "" ->
        from(u in Message,
          where: u.room_id == ^room_id,
          limit: ^limit,
          offset: ^offset
        )
        |> Repo.all()
    end
  end

  # Create a new message meta attribute
  def create_message_meta(attrs \\ %{}) do
    %MessageMeta{}
    |> MessageMeta.changeset(attrs)
    |> Repo.insert()
  end

  # Retrieve a message meta attribute by ID
  def get_message_meta_by_id(id) do
    Repo.get(MessageMeta, id)
  end

  # Update a message meta attribute
  def update_message_meta(message_meta, attrs) do
    changeset = MessageMeta.changeset(message_meta, attrs)
    Repo.update(changeset)
  end

  # Delete a message meta attribute
  def delete_message_meta(message_meta) do
    Repo.delete(message_meta)
  end

  # Get message meta by message and key
  def get_message_meta_by_key(message_id, meta_key) do
    from(
      u in MessageMeta,
      where: u.message_id == ^message_id,
      where: u.key == ^meta_key
    )
    |> Repo.one()
  end

  # Get message metas
  def get_message_metas(message_id) do
    from(
      u in MessageMeta,
      where: u.message_id == ^message_id
    )
    |> Repo.all()
  end
end
