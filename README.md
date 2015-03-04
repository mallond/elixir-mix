---
layout: post
title: "Elixir MIX"
description: "Journey and Discovery of Elixir (journal)"
category: Elixir
tags:
image: post_one.jpg

---

###newb cheats
```
iex
newb |> iex - Nothing to say here
newb |> iex.exs - iex script file
newb |> mix.exs - Elixir script file
newb |> mix deps.get
newb |> iex -S mix "use it Padawan"
newb |> AST quote do - discover code patterns
newb |> require Logger
newb |> Logger.debug("debug message: Make it meaningful")
newb |> alias :dbg, as: Dbg - get rid of the erlang ":"
newb |> :debug.tracer()
newb |> :dbg
newb |> import access functions/macros without fully-qualified name
newb |> require provides macros as a mechanism
phoenix
newb |> mix phoenix.new       # Creates Phoenix application
newb |> mix phoenix.routes    # Prints all routes
newb |> mix do deps.get, compile
newb |> mix phoenix.server    # Starts applications and their servers
environment
newb |> Webstorm Elixir Plugin - work horse
newb |> Vim Elixir - for remote and quick edits http://rustamserg.com
newb |> Google compute engine
newb |> Phoenix http://www.phoenixframework.org
```

##Style
> Liquid architecture. It's like jazz - you improvise, you work together, you
> play off each other, you make something, they make something. <br/>
> -- Frank Gehry
>
> ####[A community driven style guide for Elixir](https://github.com/niftyn8/elixir_style_guide)

> A curated list of amazingly awesome Elixir and Erlang libraries, resources and shiny things.
> Open community of shared knowledge
> ####[A community driven list of Elixir and Erlang Libraries ](https://github.com/h4cc/awesome-elixir#debugging)

# Prelude

**Elixir[erlang]**

This README.md/Blog Entry is an exploratory expedition to understand this strange and seductive language called **"Elixir."**

I have been given a week to research and create a simple REST service.

This project is by no means a finished project. However, it is my best intentions to leave a path of artifacts. Artifacts of code links, ideas, and gotchas.



<img src="https://s-media-cache-ak0.pinimg.com/236x/72/7b/7d/727b7d8d8baf95a5e26a53f926503c43.jpg" align="right" width="200px" />

### Goal
- Stand up a simple Elixir REST server
- Elixir is a Proxy to a REST service for CouchDB
- Included tid bits of advice and key knowledge points
- Learn Elixir
- Learn Phoenix
- Investigate JSON integration
- Integrate with Cloudant BigCouchDB (REST connect)
- CORS Cross-origin resource sharing (CORS) see web/security
- Discover, Correct, and learn more Elixir


### Data Structure - Keep this unbelievably simple
```
Data Structure: {
                 user: "string",
                 status: string,
                 description: "string"
                 }
```
### Abilities

1. [x] Create - Add a Log entry [Post]
2. [] Read -  A Log entry [Get]
3. [] Update - A Log entry [Post]
4. [] Delete -  All: Purge all Journal Entries [Delete]



### Wish LIst
1. [] Document Model to JSON coder/decoder
2. [] Integration module for CouchDB **** Nothing out there!
3. [] Data mapping library
4. [] Data validation Library
5. [] Larger community base of developers :)



###Inventory of Parts

-  **Erlang** Erlang is a programming language used to build massively scalable soft real-time systems with requirements on high availability.
-  **Elixir** Elixir is a dynamic, functional language designed for building scalable and maintainable applications.
-  **Cowboy** Cowboy is a small, fast and modular HTTP server written in Erlang.
-  **Cowlib** Cowlib is a support library for manipulating Web protocols.
-  **Phoenix** Elixir Web Framework targeting full-featured, fault tolerant applications with realtime functionality
-  **Plugv** A specification for composable modules in between web applications Connection adapters for different web servers in the Erlang VM
-  **Poison** Poison is a new JSON library for Elixir focusing on wicked-fast
-  **Ranch** Ranch is a socket acceptor pool for TCP protocols.
-  **HTTPoison** HTTP Client module for Couch Connections


### Phoenix Quick Start

1. mix phoenix.new elixir_mix ../elixir_mix
2. cd
3. mix do deps.get, compile
4. mix phoenix.server

###Directory
#### General
<pre><code class="lang-text">├── _build
├── config
├── deps
├── lib
├── priv
├── test
├── web
</code></pre>
#### Web
<pre><code class="lang-text">├── channels
├── controllers
│   └── page_controller.ex
├── models
├── router.ex
├── templates
│   ├── layout
│   │   └── application.html.eex
│   └── page
│       ├── error.html.eex
│       ├── index.html.eex
│       └── not_found.html.eex
├── view.ex
└── views
    ├── error_view.ex
    ├── layout_view.ex
    └── page_view.ex
</code></pre>

###The Router
Parses incoming requests and dispatches to the correct controller/action, passing parameters as needed
provides helpers to generate route paths or urls to resources
<pre><code class="lang-text">The router is the main hub of any Phoenix application.
It matches HTTP requests to controller actions, wires up realtime
channel handlers, and defines a series of pipeline transformations
for scoping middleware to sets of routes.</code></pre>

*Added CORS Plug* - See web/Security

Removed all Browser pipeline artifacts, turning Phoenix into a API server

```
defmodule ElixirMix.Router do
  use Phoenix.Router

  # REST Pipeline only
  pipeline :api do
    plug :accepts, ~w(json)
    plug CORSPlug
  end

  scope "/", ElixirMix do

    # API REST Service
    pipe_through :api # Use the default browser stack

    # REST Demo - curl is needed for this demo see README
    get    "/", CloudController, :index
    post   "/create", CloudController, :create
    get    "/read", CloudController, :read
    put    "/update", CloudController, :update
    delete "/delete", CloudController, :delete

  end

end
```

#### REST Service Example

newb |>  mix phoenix.routes (Chose not to use this)

> REST API Guidlines
>
> ####[REST API Method Reference ](http://www.restapitutorial.com/lessons/httpmethods.html)

**CREATE POST**
```
curl -X POST -H "Content-Type: application/json; charset=UTF-8" http://localhost:4000/create -d  '{"user":"Joe","status":"new","description":"Elixir demo log entry"}'

result = {"ok":true,"id":"ac600e473be3bab790d6ea66f0c04564"}

```

**READ   GET**
```
curl http://localhost:4000/read?id=1

result = {"user":"joe","status":"new","ok":"read","description":"Simple CRUD Read from Elixir"}
```

**UPDATE PUT**
```
curl -X PUT -H "Content-Type: application/json" http://localhost:4000/update  -d  '{"id":"9"}'

result = {"ok":"update - simulation"}
```

**DELETE DELETE**
```
curl -X DELETE http://localhost:4000/delete?id=1

result = {"ok":"delete - simulation"}
```




##### Define a view based on named controller
NA

##### Define a template web/templates/
NA

###The Endpoint
NA

###Controllers

> Provide functions called actions to handle requests Actions

For this demo the CREATE action has been integrated with CouchDB all others return mock JSON data

```
defmodule ElixirMix.CloudController do
  use Phoenix.Controller

  require Logger

  plug :action

  # INDEX Default service check - used for status of service only
  def index(conn, _params) do

    conn |> put_resp_content_type "application/json"
    json conn, %{ok: "index - simulation"}

  end

  # CREATE
  def create(conn, _params) do

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
```

###Views
NA

###Templates
NA

###Channels
NA

###Sockets
NA

###Topics
NA


### Cloudant aka BigCouch Integration
Please modify this module for given credentials

web/couchdb

```
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
```
### Installation and Run

1. git clone https://github.com/mallond/elixir-mix.git
2. cd elixir-mix
3. mix deps.get
4. mix Phoenix.server

Do the curl commands mentioned above [curl CREATE method may need credentials]


