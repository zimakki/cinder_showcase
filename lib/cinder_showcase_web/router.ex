defmodule CinderShowcaseWeb.Router do
  use CinderShowcaseWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {CinderShowcaseWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", CinderShowcaseWeb do
    pipe_through :browser

    live "/", HomeLive.Index, :index
    
    # Table Examples
    live "/tables", TableExamplesLive.Index, :index
    live "/tables/users", TableExamplesLive.Users, :index
    live "/tables/departments", TableExamplesLive.Departments, :index
    live "/tables/projects", TableExamplesLive.Projects, :index
    live "/tables/posts", TableExamplesLive.Posts, :index
    
    # Theme Gallery
    live "/themes", ThemeGalleryLive.Index, :index
    
    # Advanced Features
    live "/advanced", AdvancedFeaturesLive.Index, :index
    live "/advanced/filtering", AdvancedFeaturesLive.Filtering, :index
    live "/advanced/relationships", AdvancedFeaturesLive.Relationships, :index
    live "/advanced/realtime", AdvancedFeaturesLive.Realtime, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", CinderShowcaseWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:cinder_showcase, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: CinderShowcaseWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
