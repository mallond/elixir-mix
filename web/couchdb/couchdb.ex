defmodule CouchDB do

require Logger


    def create(user, status, log) do

      # Create JSON body
      uri = getServer(:noSecruity) <> "logentries/"
      body = "{\"user\": \"userVal\", \"status\": \"status\"}"
      body = String.replace(body, "userVal", user)
      body = String.replace(body, "statusVal", status)
      body = String.replace(body, "logVal", log)

      Logger.debug uri <> body

      # Invoke HTTP Post Request
      request = HTTPotion.post uri,[body: body,headers: getHeader()]

      # Decode JSON Response
      responseDecoded = JSON.decode(request.body)
      map = elem(responseDecoded,1)

      Logger.debug map["id"]

    end

    defp getServer(:noSecruity) do

       server = %Couch_Server{}
       server = server.schema <> server.hostNoSecurity <> server.path

    end

    defp getServer() do

       server = %Couch_Server{}
       server = server.schema <> server.userName <> ":" <> server.password <> server.host <> server.path

    end

    defp getHeader() do

        header = %Couch_Server{}
        header = header.header

    end


end