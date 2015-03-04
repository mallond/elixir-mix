defmodule CouchServer do

  # Server credentials and info
  defstruct schema: "https://",
            port: "4000",
            userName: "super",
            password: "man",
            path:  "/",
            host: "@bizrez.cloudant.com",
            hostNoSecurity: "bizrez.cloudant.com",
            header: ["Accept": "application/json","Content-type": "application/json;charset=utf-8"],
            query: ""
end