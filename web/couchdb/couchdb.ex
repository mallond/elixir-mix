defmodule CouchDB do

require Logger

    def getServer() do
       server = %Couch_Server{}
       server = server.schema <> server.userName <> ":" <> server.password <> server.host <> server.path
       Logger.debug server
       server
    end

    def create(user, status, log) do

      uri = getServer() <> "logentries/"
      body = "{\"user\": \"userVal\", \"status\": \"status\"}"
      body = String.replace(body, "userVal", user)
      body = String.replace(body, "statusVal", status)
      body = String.replace(body, "logVal", log)
      Logger.debug uri <> body

      request = HTTPotion.post uri,
                 [body: body,
                 headers: ["Accept": "application/json","Content-type": "application/json;charset=utf-8"]]

      responseDecoded = JSON.decode(request.body)
      map = elem(responseDecoded,1)
      Logger.debug map["id"]

    end

end