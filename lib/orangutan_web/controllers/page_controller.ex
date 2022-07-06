# Copyright 2022 Clivern. All rights reserved.
# Use of this source code is governed by the MIT
# license that can be found in the LICENSE file.

defmodule OrangutanWeb.PageController do
  use OrangutanWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
