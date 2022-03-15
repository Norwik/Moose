# Copyright 2022 Clivern. All rights reserved.
# Use of this source code is governed by the MIT
# license that can be found in the LICENSE file.

defmodule ChatWeb.ActionController do
  use ChatWeb, :controller

  def join(conn, _params) do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, "{\"status\": \"ok\"}")
  end

  def signup(conn, _params) do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, "{\"status\": \"ok\"}")
  end

  def login(conn, _params) do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, "{\"status\": \"ok\"}")
  end

  def reset_password(conn, _params) do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, "{\"status\": \"ok\"}")
  end
end
