# Copyright 2022 Clivern. All rights reserved.
# Use of this source code is governed by the MIT
# license that can be found in the LICENSE file.

defmodule Orangutan.Context.UserContext do
  @moduledoc """
  User Context Module
  """

  import Ecto.Query
  alias Orangutan.Repo
  alias Orangutan.Model.{UserMeta, User}

  @doc """
  Get a new User
  """
  def user(user \\ %{}) do
    %{
      email: user.email,
      name: user.name,
      password_hash: user.password_hash,
      verified: user.verified,
      last_seen: user.last_seen,
      role: user.role,
      api_key: Ecto.UUID.generate(),
      uuid: Ecto.UUID.generate()
    }
  end

  @doc """
  Get a User Meta
  """
  def meta(meta \\ %{}) do
    %{
      key: meta.key,
      value: meta.value,
      user_id: meta.user_id
    }
  end

  @doc """
  Create a new User
  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Retrieve a User by ID
  """
  def get_user_by_id(id) do
    Repo.get(User, id)
  end

  @doc """
  Get User by UUID
  """
  def get_user_by_uuid(uuid) do
    from(
      u in User,
      where: u.uuid == ^uuid
    )
    |> Repo.one()
  end

  @doc """
  Get User by API Key
  """
  def get_user_by_api_key(api_key) do
    from(
      u in User,
      where: u.api_key == ^api_key
    )
    |> Repo.one()
  end

  @doc """
  Get User by Email
  """
  def get_user_by_email(email) do
    from(
      u in User,
      where: u.email == ^email
    )
    |> Repo.one()
  end

  @doc """
  Update a User
  """
  def update_user(user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Delete a User
  """
  def delete_user(user) do
    Repo.delete(user)
  end

  @doc """
  Retrieve all Users
  """
  def get_users() do
    Repo.all(User)
  end

  @doc """
  Retrieve Users
  """
  def get_users(offset, limit) do
    from(u in User,
      limit: ^limit,
      offset: ^offset
    )
    |> Repo.all()
  end

  @doc """
  Count all Users
  """
  def count_users() do
    from(u in User,
      select: count(u.id)
    )
    |> Repo.one()
  end

  @doc """
  Create a new User Meta
  """
  def create_meta(attrs \\ %{}) do
    %UserMeta{}
    |> UserMeta.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Retrieve a User Meta by ID
  """
  def get_meta_by_id(id) do
    Repo.get(UserMeta, id)
  end

  @doc """
  Update a User Ueta
  """
  def update_meta(user_meta, attrs) do
    UserMeta.changeset(user_meta, attrs)
    |> Repo.update()
  end

  @doc """
  Delete a User Meta
  """
  def delete_meta(user_meta) do
    Repo.delete(user_meta)
  end

  @doc """
  Get Meta by User ID and Key
  """
  def get_meta_by_user_id_key(user_id, meta_key) do
    from(
      u in UserMeta,
      where: u.user_id == ^user_id,
      where: u.key == ^meta_key
    )
    |> Repo.one()
  end

  @doc """
  Get User Metas
  """
  def get_user_metas(user_id) do
    from(
      u in UserMeta,
      where: u.user_id == ^user_id
    )
    |> Repo.all()
  end

  @doc """
  Validate User ID
  """
  def validate_user_id(user_id) do
    user = Repo.get(User, user_id)

    case user do
      nil ->
        false

      _ ->
        true
    end
  end
end
