# Copyright 2022 Clivern. All rights reserved.
# Use of this source code is governed by the MIT
# license that can be found in the LICENSE file.

defmodule OrangutanWeb.UserController do
  use OrangutanWeb, :controller
  alias Orangutan.Context.UserContext

  @default_list_limit "10"
  @default_list_offset "0"

  # Get user endpoint
  def index(conn, %{"id" => id}) do
    case Integer.parse(id) do
      {_, ""} ->
        user = UserContext.get_user_by_id(id)

        if user do
          conn
          |> put_status(:ok)
          |> render("index.json", %{user: user})
        else
          conn
          |> put_status(:not_found)
          |> render("error.json", %{error: "User with ID #{id} not found"})
        end

      :error ->
        conn
        |> put_status(:bad_request)
        |> render("error.json", %{error: "Invalid User ID"})
    end
  end

  # List users endpoint
  def list(conn, params) do
    limit = String.to_integer(params["limit"] || @default_list_limit)
    offset = String.to_integer(params["offset"] || @default_list_offset)
    country = params["country"] || ""
    gender = params["gender"] || ""

    users = UserContext.get_users(country, gender, offset, limit)

    render(conn, "list.json", %{
      users: users,
      metadata: %{
        limit: limit,
        offset: offset,
        totalCount: UserContext.count_users(country, gender)
      }
    })
  end

  # Create a new User
  def create(conn, params) do
    user =
      UserContext.new_user(%{
        age: params["age"] || 18,
        country: params["country"] || "",
        email: params["email"] || "",
        gender: params["gender"] || "",
        name: params["name"] || "",
        password: params["password"] || "",
        state: params["state"] || "",
        username: params["username"] || "",
        verified: false
      })

    case UserContext.create_user(user) do
      {:ok, user} ->
        conn
        |> put_status(:created)
        |> render("index.json", %{user: user})

      {:error, changeset} ->
        messages =
          changeset.errors()
          |> Enum.map(fn {field, {message, _options}} -> "#{field}: #{message}" end)

        conn
        |> put_status(:bad_request)
        |> render("error.json", %{error: Enum.at(messages, 0)})
    end
  end

  # Update a user
  def update(conn, params) do
    id = params["id"]

    case Integer.parse(id) do
      {_int, ""} ->
        user = UserContext.get_user_by_id(id)

        if user do
          new_user =
            UserContext.new_user(%{
              age: params["age"] || user.age,
              country: params["country"] || user.country,
              email: params["email"] || user.email,
              gender: params["gender"] || user.gender,
              name: params["name"] || user.name,
              password: params["password"] || user.password,
              state: params["state"] || user.state,
              username: params["username"] || user.username,
              verified: user.verified
            })

          case UserContext.update_user(user, new_user) do
            {:ok, user} ->
              conn
              |> put_status(:ok)
              |> render("index.json", %{user: user})

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

  # Delete a User Endpoint
  def delete(conn, %{"id" => id}) do
    case Integer.parse(id) do
      {_int, ""} ->
        user = UserContext.get_user_by_id(id)

        if user do
          UserContext.delete_user(user)

          conn
          |> send_resp(:no_content, "")
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
end
