# Copyright 2022 Clivern. All rights reserved.
# Use of this source code is governed by the MIT
# license that can be found in the LICENSE file.

defmodule Orangutan.Context.DomainContext do
  @moduledoc """
  Domain Context Module
  """

  import Ecto.Query
  alias Orangutan.Repo
  alias Orangutan.Model.{DomainMeta, Domain}

  @doc """
  Get a new Domain
  """
  def domain(domain \\ %{}) do
    %{
      domain: domain.domain,
      verified: domain.verified,
      public: domain.public,
      user_id: domain.user_id,
      uuid: Ecto.UUID.generate()
    }
  end

  @doc """
  Get a Domain Meta
  """
  def meta(meta \\ %{}) do
    %{
      key: meta.key,
      value: meta.value,
      domain_id: meta.domain_id
    }
  end

  @doc """
  Create a new Domain
  """
  def create_domain(attrs \\ %{}) do
    %Domain{}
    |> Domain.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Retrieve a Domain by ID
  """
  def get_domain_by_id(id) do
    Repo.get(Domain, id)
  end

  @doc """
  Get Domain by UUID
  """
  def get_domain_by_uuid(uuid) do
    from(d in Domain,
      where: d.uuid == ^uuid
    )
    |> Repo.one()
  end

  @doc """
  Update a Domain
  """
  def update_domain(domain, attrs) do
    domain
    |> Domain.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Delete a Domain
  """
  def delete_domain(domain) do
    Repo.delete(domain)
  end

  @doc """
  Retrieve all Domains
  """
  def get_domains() do
    Repo.all(Domain)
  end

  @doc """
  Retrieve Domains
  """
  def get_domains(offset, limit) do
    from(d in Domain,
      where: limit == ^limit,
      where: offset == ^offset
    )
    |> Repo.all()
  end

  @doc """
  Retrieve User Domains
  """
  def get_user_domains(user_id, offset, limit) do
    from(d in Domain,
      where: user_id == ^user_id,
      where: limit == ^limit,
      where: offset == ^offset
    )
    |> Repo.all()
  end

  @doc """
  Count all Domains
  """
  def count_domains() do
    from(d in Domain,
      select: count(d.id)
    )
    |> Repo.one()
  end

  @doc """
  Create a new Domain Meta
  """
  def create_meta(attrs \\ %{}) do
    %DomainMeta{}
    |> DomainMeta.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Retrieve a Domain Meta by ID
  """
  def get_meta_by_id(id) do
    Repo.get(DomainMeta, id)
  end

  @doc """
  Update a Domain Meta
  """
  def update_meta(domain_meta, attrs) do
    domain_meta
    |> DomainMeta.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Delete a Domain Meta
  """
  def delete_meta(domain_meta) do
    Repo.delete(domain_meta)
  end

  @doc """
  Get Domain by Domain ID and key
  """
  def get_meta_by_domain_id_key(domain_id, meta_key) do
    from(
      d in DomainMeta,
      where: d.domain_id == ^domain_id,
      where: d.key == ^meta_key
    )
    |> Repo.one()
  end

  @doc """
  Get Domain Metas
  """
  def get_domain_metas(domain_id) do
    from(
      d in DomainMeta,
      where: d.domain_id == ^domain_id
    )
    |> Repo.all()
  end

  @doc """
  Validate Domain ID
  """
  def validate_domain_id(domain_id) do
    domain = Repo.get(Domain, domain_id)

    case domain do
      nil ->
        false

      _ ->
        true
    end
  end
end
