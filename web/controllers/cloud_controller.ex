defmodule ElixirMix.CloudController do
  use Phoenix.Controller

  require Logger

  plug :action

  # INDEX Default service check - used for status of service only
  def index(conn, _params) do

    conn |> put_resp_content_type "application/json"
    json conn, %{ok: "index - simulation"}

  end

  # Using HttPoision Mirror
  def mirror(conn, _params) do

      Logger.debug "mirror my request"
      url = "http://127.0.0.1:4000/read?id=1"
      Logger.debug url
      case HTTPoison.get(url) do
        {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
          json conn, body
        {:ok, %HTTPoison.Response{status_code: 404}} ->
          IO.puts "Not found :("
        {:error, %HTTPoison.Error{reason: reason}} ->
          IO.inspect reason
      end

  end

  # CREATE
  def test(conn, _params) do

    # Submit create request and get reposonse from Cloudant
    response = CouchDB.create _params["user"], _params["status"], _params["description"]
    completedok = response |> elem 0

    # Prepare response to client
    conn |> put_resp_content_type "application/json"

    # Completed return Cloudant ID
    if completedok do
      map = response |> elem 1
      id = map["id"]
      json conn, %{ok: true, id: id}
    else
      json conn, %{ok: false}
    end

  end

  # READ curl http://localhost:4000/read?id=1
  def read(conn, _parms) do

    Logger.debug "GET read"
    conn |> put_resp_content_type "application/json"
    json conn, %{ok: "read", user: "joe", status: "new", description: "Simple CRUD Read from Elixir"}

  end

  # UPDATE curl -X PUT -H "Content-Type: application/json" http://localhost:4000/update  -d  '{"id":"9"}'
  def update(conn, _params) do

    Logger.debug "PUT update"
    conn |> put_resp_content_type "application/json"
    json conn, %{ok: "update - simulation"}

  end

  # DELETE curl -X DELETE http://localhost:4000/delete?id=1
  def delete(conn, _params) do

    Logger.debug "DELETE delete"
    conn |> put_resp_content_type "application/json"
    json conn, %{ok: "delete - simulation"}

  end

end