defmodule CainWeb.PageController do
  use CainWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
