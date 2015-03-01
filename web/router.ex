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
