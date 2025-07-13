defmodule CinderShowcaseWeb do
  @moduledoc """
  The entrypoint for defining your web interface, such
  as controllers, components, channels, and so on.

  This can be used in your application as:

      use CinderShowcaseWeb, :controller
      use CinderShowcaseWeb, :html

  The definitions below will be executed for every controller,
  component, etc, so keep them short and clean, focused
  on imports, uses and aliases.

  Do NOT define functions inside the quoted expressions
  below. Instead, define additional modules and import
  those modules here.
  """

  def static_paths, do: ~w(assets fonts images favicon.ico robots.txt)

  def router do
    quote do
      use Phoenix.Router, helpers: false

      # Import common connection and controller functions to use in pipelines
      import Plug.Conn
      import Phoenix.Controller
      import Phoenix.LiveView.Router
    end
  end

  def channel do
    quote do
      use Phoenix.Channel
    end
  end

  def controller do
    quote do
      use Phoenix.Controller, formats: [:html, :json]

      use Gettext, backend: CinderShowcaseWeb.Gettext

      import Plug.Conn

      unquote(verified_routes())
    end
  end

  def live_view do
    quote do
      use Phoenix.LiveView

      unquote(html_helpers())
      
      @impl true
      def handle_params(params, url, socket) do
        uri = URI.parse(url)
        {:noreply, socket |> assign(:current_path, uri.path) |> handle_params_impl(params, url)}
      end
      
      # Default implementation, can be overridden
      def handle_params_impl(socket, _params, _url), do: socket
      
      defoverridable handle_params: 3, handle_params_impl: 3
    end
  end

  def live_component do
    quote do
      use Phoenix.LiveComponent

      unquote(html_helpers())
    end
  end

  def html do
    quote do
      use Phoenix.Component

      # Import convenience functions from controllers
      import Phoenix.Controller,
        only: [get_csrf_token: 0, view_module: 1, view_template: 1]

      # Include general helpers for rendering HTML
      unquote(html_helpers())
    end
  end

  defp html_helpers do
    quote do
      # Translation
      use Gettext, backend: CinderShowcaseWeb.Gettext

      # HTML escaping functionality
      import Phoenix.HTML
      # Core UI components
      import CinderShowcaseWeb.CoreComponents

      # Common modules used in templates
      alias Phoenix.LiveView.JS
      alias CinderShowcaseWeb.Layouts

      # Routes generation with the ~p sigil
      unquote(verified_routes())
    end
  end

  def verified_routes do
    quote do
      use Phoenix.VerifiedRoutes,
        endpoint: CinderShowcaseWeb.Endpoint,
        router: CinderShowcaseWeb.Router,
        statics: CinderShowcaseWeb.static_paths()
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/live_view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
