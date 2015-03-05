defmodule CouchDB do

    require Logger

    # Creates
    def create(user, status, description) do

      # Create JSON body (bypass secruity for demo)
      uri = :noSecruity |> getServer
      uri = uri <> "logentries/"

      # JSON Document in String format - To be passed to Cloudant
      body = "{\"user\": \"userVal\", \"status\": \"statusVal\",\"description\": \"descriptionVal\" }"
      body = body |> String.replace "userVal", user
      body = body |> String.replace "statusVal", status
      body = body |> String.replace "descriptionVal", description

      # Request Create
      response = HTTPotion.post uri,[body: body,headers: getHeader()]

      # On Result
      cond do
            response.status_code in 200..299 ->
              responseDecoded = response.body |> JSON.decode
            response.status_code in 400..599 ->
              {:error, response.body}
            true ->
              {:error}
      end

    end



    # Get server setup :nosecurity
    def getServer(:noSecruity) do

       server = %CouchServer{}
       server = server.schema <> server.hostNoSecurity <> server.path

    end

    # Get server setup :nosecurity
    defp getServer() do

       server = %CouchServer{}
       server = server.schema <> server.userName <> ":" <> server.password <> server.host <> server.path

    end


    # Get Header info
    defp getHeader() do

        header = %CouchServer{}
        header = header.header

    end

end