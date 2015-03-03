defmodule ElixirMix.HelloController do
  use Phoenix.Controller

  require Logger

  plug :action


  def index(conn, _params) do
    Logger.info "Hello from the Hello Controller"
    render conn, "index.html"
  end

end