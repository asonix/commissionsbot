defmodule Commissionsbot.PageController do
  use Commissionsbot.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
