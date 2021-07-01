# Copyright 2022 Clivern. All rights reserved.
# Use of this source code is governed by the MIT
# license that can be found in the LICENSE file.

defmodule OrangutanWeb.ClientController do
  @moduledoc """
  Client Controller
  """

  use OrangutanWeb, :controller
  alias Orangutan.Context.ClientContext

  @default_list_limit "10"
  @default_list_offset "0"

  @doc """
  View Client Endpoint
  """
  def index(conn, %{"id" => id}) do
    case Integer.parse(id) do
      {_int, ""} ->
        client = ClientContext.get_client_by_id(id)

        if client do
          conn
          |> put_status(:ok)
          |> render("index.json", %{client: client})
        else
          conn
          |> put_status(:not_found)
          |> render("error.json", %{error: "Client with ID #{id} not found"})
        end

      _ ->
        conn
        |> put_status(:bad_request)
        |> render("error.json", %{error: "Invalid Client ID"})
    end
  end

  @doc """
  List Clients Endpoint
  """
  def list(conn, params) do
    limit = String.to_integer(params["limit"] || @default_list_limit)
    offset = String.to_integer(params["offset"] || @default_list_offset)
    country = params["country"] || ""
    gender = params["gender"] || ""

    clients = ClientContext.get_clients(country, gender, offset, limit)

    render(conn, "list.json", %{
      clients: clients,
      metadata: %{
        limit: limit,
        offset: offset,
        totalCount: ClientContext.count_clients(country, gender)
      }
    })
  end

  @doc """
  Create Client Endpoint
  """
  def create(conn, params) do
    client =
      ClientContext.new_client(%{
        age: params["age"] || 18,
        country: params["country"] || "",
        gender: params["gender"] || "",
        state: params["state"] || "",
        username: params["username"] || "",
        user_id: params["userId"] || nil
      })

    case ClientContext.create_client(client) do
      {:ok, client} ->
        conn
        |> put_status(:created)
        |> render("index.json", %{client: client})

      {:error, changeset} ->
        messages =
          changeset.errors()
          |> Enum.map(fn {field, {message, _options}} -> "#{field}: #{message}" end)

        conn
        |> put_status(:bad_request)
        |> render("error.json", %{error: Enum.at(messages, 0)})
    end
  end

  @doc """
  Update Client Endpoint
  """
  def update(conn, params) do
    id = params["id"]

    case Integer.parse(id) do
      {_int, ""} ->
        client = ClientContext.get_client_by_id(id)

        if client do
          new_client =
            ClientContext.new_client(%{
              age: params["age"] || 18,
              country: params["country"] || "",
              gender: params["gender"] || "",
              state: params["state"] || "",
              username: params["username"] || "",
              user_id: params["userId"] || nil
            })

          case ClientContext.update_client(client, new_client) do
            {:ok, client} ->
              conn
              |> put_status(:ok)
              |> render("index.json", %{client: client})

            {:error, changeset} ->
              messages =
                changeset.errors()
                |> Enum.map(fn {field, {message, _options}} -> "#{field}: #{message}" end)

              conn
              |> put_status(:bad_request)
              |> render("error.json", %{error: Enum.at(messages, 0)})
          end
        else
          conn
          |> put_status(:not_found)
          |> render("error.json", %{error: "User with ID #{id} not found"})
        end

      _ ->
        conn
        |> put_status(:bad_request)
        |> render("error.json", %{error: "Invalid User ID"})
    end
  end

  @doc """
  Delete Client Endpoint
  """
  def delete(conn, %{"id" => id}) do
    case Integer.parse(id) do
      {_int, ""} ->
        client = ClientContext.get_client_by_id(id)

        if client do
          ClientContext.delete_client(client)

          conn
          |> send_resp(:no_content, "")
        else
          conn
          |> put_status(:not_found)
          |> render("error.json", %{error: "Client with ID #{id} not found"})
        end

      _ ->
        conn
        |> put_status(:bad_request)
        |> render("error.json", %{error: "Invalid Client ID"})
    end
  end
end
