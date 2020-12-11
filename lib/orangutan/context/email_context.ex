# Copyright 2022 Clivern. All rights reserved.
# Use of this source code is governed by the MIT
# license that can be found in the LICENSE file.

defmodule Orangutan.Context.EmailContext do
  @moduledoc """
  Email Context Module
  """

  import Ecto.Query
  alias Orangutan.Repo
  alias Orangutan.Model.{EmailMeta, Email}

  @doc """
  Get a new Email
  """
  def email(email \\ %{}) do
    %{
      email: email.email,
      domain_id: email.domain_id,
      expire: email.expire,
      expire_at: email.expire_at,
      uuid: Ecto.UUID.generate()
    }
  end

  @doc """
  Get a Email Meta
  """
  def meta(meta \\ %{}) do
    %{
      key: meta.key,
      value: meta.value,
      email_id: meta.email_id
    }
  end

  @doc """
  Create a new Email
  """
  def create_email(attrs \\ %{}) do
    %Email{}
    |> Email.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Retrieve a Email by ID
  """
  def get_email_by_id(id) do
    Repo.get(Email, id)
  end

  @doc """
  Get Email by UUID
  """
  def get_email_by_uuid(uuid) do
    from(
      e in Email,
      where: e.uuid == ^uuid
    )
    |> Repo.one()
  end

  @doc """
  Get Email by Email
  """
  def get_email_by_email(email) do
    from(
      e in Email,
      where: e.email == ^email
    )
    |> Repo.one()
  end

  @doc """
  Update an Email
  """
  def update_email(email, attrs) do
    email
    |> Email.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Delete an Email
  """
  def delete_email(email) do
    Repo.delete(email)
  end

  @doc """
  Retrieve all Emails
  """
  def get_emails() do
    Repo.all(Email)
  end

  @doc """
  Retrieve Emails
  """
  def get_emails(offset, limit) do
    from(e in Email,
      where: e.limit == ^limit,
      where: e.offset == ^offset
    )
    |> Repo.all()
  end

  @doc """
  Count all Emails
  """
  def count_emails() do
    from(e in Email,
      select: count(e.id)
    )
    |> Repo.one()
  end

  @doc """
  Create a new Email Meta
  """
  def create_meta(attrs \\ %{}) do
    %EmailMeta{}
    |> EmailMeta.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Retrieve an Email Meta by ID
  """
  def get_meta_by_id(id) do
    Repo.get(EmailMeta, id)
  end

  @doc """
  Update an Email Meta
  """
  def update_meta(email_meta, attrs) do
    email_meta
    |> EmailMeta.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Delete an Email Meta
  """
  def delete_meta(email_meta) do
    Repo.delete(email_meta)
  end

  @doc """
  Get Meta by Email ID and Key
  """
  def get_meta_by_email_id_key(email_id, meta_key) do
    from(
      e in EmailMeta,
      where: e.email_id == ^email_id,
      where: e.key == ^meta_key
    )
    |> Repo.one()
  end

  @doc """
  Get Email Metas
  """
  def get_email_metas(email_id) do
    from(
      e in EmailMeta,
      where: e.email_id == ^email_id
    )
    |> Repo.all()
  end

  @doc """
  Validate Email ID
  """
  def validate_email_id(email_id) do
    email = Repo.get(Email, email_id)

    case email do
      nil ->
        false

      _ ->
        true
    end
  end
end
