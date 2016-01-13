defmodule Component.Router do
  use Component.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Component do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/scoped", PageController, :index, as: "scope_test"
    
  end

  # Other scopes may use custom stacks.
  # scope "/api", Component do
  #   pipe_through :api
  # end
end
