defmodule ElixirMix.CloudController do
  use Phoenix.Controller

  require Logger

  plug :action

  def index(conn, _params) do
    conn |> put_resp_content_type("application/json")
    json conn, %{action: "index/ok"}
  end

  # curl -X POST -H "Content-Type: application/json; charset=UTF-8" http://localhost:4000/create -d  '{"id":"9"}'
  def create(conn, _params) do
    Logger.debug "POST Create "
    conn |> put_resp_content_type("application/json")
    json conn, %{action: "create"}
  end

  # curl http://localhost:4000/read?id=1
  def read(conn, _parms) do
    Logger.debug "GET read"
    conn |> put_resp_content_type("application/json")
    json conn, %{action: "show"}
  end

  # curl -X PUT -H "Content-Type: application/json" http://localhost:4000/update  -d  '{"id":"9"}'
  def update(conn, _params) do
    Logger.debug "PUT update"
    conn |> put_resp_content_type("application/json")
    json conn, %{action: "update"}
  end

  # curl -X DELETE http://localhost:4000/delete?id=1
  def delete(conn, _params) do
    Logger.debug "DELETE delete"
    conn |> put_resp_content_type("application/json")
    json conn, %{action: "delete"}
  end

end