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

# Prelude

**Elixir**

This is an exploratory expedition to find and understand
this strange but seductive language called elixir.
<img src="https://s-media-cache-ak0.pinimg.com/236x/72/7b/7d/727b7d8d8baf95a5e26a53f926503c43.jpg" align="right" width="200px" />

### Goal
Stand up a simple Elixir server with REST services
with simple Get, Put, Delete, Post methods. Also,
to be included in this journey tid bits of advice and
key knowledge points.


### Design
```
Data Structure: {
                 user: "string",
                 date: dateTime,
                 tag: "string",
                 shortTitle: "string",
                 description: "string"
                 }
```
### Abilities
1. List: List all Journal Entries [Get]
2. Add: Journal Entries [Put]
3. Update: Journal Entries [Post]
4. Purge All: Purge all Journal Entries [Delete]



###Inventory of Parts

-  **Erlang** Erlang is a programming language used to build massively scalable soft real-time systems with requirements on high availability.
-  **Elixir** Elixir is a dynamic, functional language designed for building scalable and maintainable applications.
-  **Cowboy** Cowboy is a small, fast and modular HTTP server written in Erlang.
-  **Cowlib** Cowlib is a support library for manipulating Web protocols.
-  **Phoenix** Elixir Web Framework targeting full-featured, fault tolerant applications with realtime functionality
-  **Plugv** A specification for composable modules in between web applications Connection adapters for different web servers in the Erlang VM
-  **Poison** Poison is a new JSON library for Elixir focusing on wicked-fast
-  **Ranch** Ranch is a socket acceptor pool for TCP protocols.




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
parses incoming requests and dispatches to the correct controller/action, passing parameters as needed
provides helpers to generate route paths or urls to resources
<pre><code class="lang-text">The router is the main hub of any Phoenix application.
It matches HTTP requests to controller actions, wires up realtime
channel handlers, and defines a series of pipeline transformations
for scoping middleware to sets of routes.</code></pre>

Hello World Router
```
defmodule ElixirMix.Router do
  use Phoenix.Router

  pipeline :browser do
    plug :accepts, ~w(html)
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ~w(json)
  end

  scope "/", ElixirMix do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/hello", HelloController, :index

    resources "/cloud", UserController

  end

  # Other scopes may use custom stacks.
  # scope "/api", ElixirMix do
  #   pipe_through :api
  # end
end

```

#### Rest Service Example

newb |>  mix phoenix.routes (Chose not to use this)

Create - POST    /cloud           ElixirMix.CloudController.create/2
Read   - GET     /cloud/:id       ElixirMix.CloudController.read/2
Update - PUT     /cloud/:id       ElixirMix.CloudController.update/2
Delete - DELETE  /cloud/:id       ElixirMix.CloudController.delete/2


####Hello World Example

*[Recipe Card]*

> 1. Create a Controller web/controllers - See define the controller
> 2. Create a view web/views - See define a view
> 3. Create a template web/template - See define a template
> 4. Add Controller into the router - See Main Router

##### Main Router with Hello Controller
'defmodule ElixirMix.Router do
```
  scope "/", ElixirMix do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/hello", HelloController, :index

    resources "/cloud", UserController

  end
```
##### Define the controller (see Main Router)
newb |> naming is important. The last part of the module needs to end in Controller
```
defmodule ElixirMix.HelloController do
  use Phoenix.Controller

  plug :action

  def index(conn, _params) do
    render conn, "index.html"
  end

end
```

##### Define a view based on named controller
```
defmodule ElixirMix.HelloView do
  use ElixirMix.View
end
```

##### Define a template web/templates/[name]
```
<div class="jumbotron">
  <h2>Hello World, from Phoenix!</h2>
</div>
```


###The Endpoint
handles all aspects of requests up until the beginning of our applications
###Controllers
provide functions called actions to handle requests
Actions
prepare data and pass it into views
invoke rendering via views
perform redirects
###Views
render templates
define helper functions, available in templates, to decorate raw data
###Templates
are what they sound like :)
###Channels
manage sockets
are roughly analogous to controllers except that they are bi-directional and persistent
###Sockets
are multiplexed, persistent connections
###Topics
serve as a PubSub broadcast layer


