defmodule CinderShowcaseWeb.Components.Layout.Navigation do
  use Phoenix.Component
  import CinderShowcaseWeb.CoreComponents

  attr :current_path, :string, required: true

  def navigation(assigns) do
    ~H"""
    <nav class="bg-white shadow-sm border-b border-gray-200">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex justify-between h-16">
          <div class="flex">
            <!-- Logo -->
            <.link navigate="/" class="flex items-center">
              <span class="text-2xl font-bold bg-clip-text text-transparent bg-gradient-to-r from-purple-600 to-indigo-600">
                Cinder
              </span>
            </.link>

            <!-- Navigation Links -->
            <div class="hidden sm:ml-10 sm:flex sm:space-x-8">
              <.nav_link href="/tables" current_path={@current_path}>
                Tables
              </.nav_link>
              <.nav_link href="/themes" current_path={@current_path}>
                Themes
              </.nav_link>
              <.nav_link href="/advanced" current_path={@current_path}>
                Advanced
              </.nav_link>
            </div>
          </div>

          <!-- Right side links -->
          <div class="flex items-center space-x-4">
            <a
              href="https://github.com/ash-project/cinder"
              target="_blank"
              class="text-gray-500 hover:text-gray-700 transition-colors"
            >
              <svg class="h-6 w-6" fill="currentColor" viewBox="0 0 24 24">
                <path d="M12 0c-6.626 0-12 5.373-12 12 0 5.302 3.438 9.8 8.207 11.387.599.111.793-.261.793-.577v-2.234c-3.338.726-4.033-1.416-4.033-1.416-.546-1.387-1.333-1.756-1.333-1.756-1.089-.745.083-.729.083-.729 1.205.084 1.839 1.237 1.839 1.237 1.07 1.834 2.807 1.304 3.492.997.107-.775.418-1.305.762-1.604-2.665-.305-5.467-1.334-5.467-5.931 0-1.311.469-2.381 1.236-3.221-.124-.303-.535-1.524.117-3.176 0 0 1.008-.322 3.301 1.23.957-.266 1.983-.399 3.003-.404 1.02.005 2.047.138 3.006.404 2.291-1.552 3.297-1.23 3.297-1.23.653 1.653.242 2.874.118 3.176.77.84 1.235 1.911 1.235 3.221 0 4.609-2.807 5.624-5.479 5.921.43.372.823 1.102.823 2.222v3.293c0 .319.192.694.801.576 4.765-1.589 8.199-6.086 8.199-11.386 0-6.627-5.373-12-12-12z" />
              </svg>
            </a>
            <a
              href="https://hexdocs.pm/cinder"
              target="_blank"
              class="text-gray-500 hover:text-gray-700 transition-colors"
            >
              <.icon name="hero-book-open" class="h-6 w-6" />
            </a>
          </div>
        </div>
      </div>
    </nav>
    """
  end

  defp nav_link(assigns) do
    active? = String.starts_with?(assigns.current_path, assigns.href)

    assigns =
      assigns
      |> assign(:active?, active?)
      |> assign(:class, nav_link_class(active?))

    ~H"""
    <.link navigate={@href} class={@class}>
      <%= render_slot(@inner_block) %>
    </.link>
    """
  end

  defp nav_link_class(true) do
    "inline-flex items-center px-1 pt-1 border-b-2 border-purple-600 text-sm font-medium text-gray-900"
  end

  defp nav_link_class(false) do
    "inline-flex items-center px-1 pt-1 border-b-2 border-transparent text-sm font-medium text-gray-500 hover:text-gray-700 hover:border-gray-300 transition-colors"
  end
end