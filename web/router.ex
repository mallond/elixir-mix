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
