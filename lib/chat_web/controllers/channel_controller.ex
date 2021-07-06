# Copyright 2022 Clivern. All rights reserved.
# Use of this source code is governed by the MIT
# license that can be found in the LICENSE file.

defmodule ChatWeb.ChannelController do
  use ChatWeb, :controller

  def list(conn, _params) do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, "{}")
  end

  def create(conn, _params) do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(201, "{}")
  end

  def index(conn, %{"id" => id}) do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, "{\"id\": #{id}}")
  end

  def update(conn, %{"id" => id}) do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, "{\"id\": #{id}}")
  end

  def delete(conn, %{"id" => id}) do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(204, "{\"id\": #{id}}")
  end
end
