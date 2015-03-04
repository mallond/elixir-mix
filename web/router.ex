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

    # API REST Service
    pipe_through :api # Use the default browser stack

    # Hello Moto Example
    get "/", PageController, :index
    get "/hello", HelloController, :index
    get "/cloud", HelloController, :index

    # REST Demo - curl is needed for this demo see README
    post   "/create", CloudController, :create
    get    "/read", CloudController, :read
    put    "/update", CloudController, :update
    delete "/delete", CloudController, :delete

  end

end
