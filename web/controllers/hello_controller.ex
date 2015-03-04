defmodule ElixirMix.HelloController do
  use Phoenix.Controller

  require Logger

  plug :action

  # Hello Demo
  def index(conn, _params) do

    Logger.info "Hello from the Hello Controller"
    render conn, "index.html"

  end

end