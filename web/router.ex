defmodule ElixirMix.Router do
  use Phoenix.Router

  require Logger

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

    pipe_through :api # Use the default browser stack

    get "/", PageController, :index
    get "/hello", HelloController, :index

    post "/create", CloudController, :create
    get "/read", CloudController, :read
    put "/update", CloudController, :update
    delete "/delete", CloudController, :delete



  end

  # Other scopes may use custom stacks.
  # scope "/api", ElixirMix do
  #   pipe_through :api
  # end
end
