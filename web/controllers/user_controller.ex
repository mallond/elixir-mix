defmodule ElixirMix.UserController do
  use Phoenix.Controller

  plug :action


  def index(conn, _params) do

      conn |> put_resp_content_type("application/json")
      a = "Hello Moto - index"
      json conn, %{message: a}
  end

  def new(conn, _params) do
     json conn, %{message: "Hello Moto - new"}
  end


end