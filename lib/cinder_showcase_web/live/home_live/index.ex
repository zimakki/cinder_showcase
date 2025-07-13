defmodule CinderShowcaseWeb.HomeLive.Index do
  use CinderShowcaseWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:page_title, "Cinder Showcase - Intelligent Data Tables for Ash Framework")
     |> assign(:features, features())}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="min-h-screen bg-gradient-to-br from-purple-50 to-indigo-100">
      <!-- Hero Section -->
      <div class="relative overflow-hidden">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-24">
          <div class="text-center">
            <h1 class="text-6xl font-extrabold text-gray-900 mb-6">
              <span class="bg-clip-text text-transparent bg-gradient-to-r from-purple-600 to-indigo-600">
                Cinder
              </span>
            </h1>
            <p class="text-2xl text-gray-700 mb-8 max-w-3xl mx-auto">
              Intelligent data tables and card components for Ash Framework resources in Phoenix LiveView applications
            </p>
            <div class="flex gap-4 justify-center">
              <.link
                navigate="/tables"
                class="px-8 py-3 bg-purple-600 text-white font-medium rounded-lg hover:bg-purple-700 transition-colors"
              >
                View Examples
              </.link>
              <.link
                navigate="/themes"
                class="px-8 py-3 bg-white text-purple-600 font-medium rounded-lg border-2 border-purple-600 hover:bg-purple-50 transition-colors"
              >
                Browse Themes
              </.link>
            </div>
          </div>
        </div>
      </div>

      <!-- Features Grid -->
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-16">
        <h2 class="text-3xl font-bold text-center text-gray-900 mb-12">
          Powerful Features Out of the Box
        </h2>
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
          <div :for={feature <- @features} class="bg-white rounded-xl shadow-lg p-6 hover:shadow-xl transition-shadow">
            <div class="w-12 h-12 bg-purple-100 rounded-lg flex items-center justify-center mb-4">
              <div class={"h-6 w-6 text-purple-600 #{feature.icon}"}></div>
            </div>
            <h3 class="text-xl font-semibold text-gray-900 mb-2"><%= feature.title %></h3>
            <p class="text-gray-600"><%= feature.description %></p>
          </div>
        </div>
      </div>

      <!-- Navigation Cards -->
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-16">
        <h2 class="text-3xl font-bold text-center text-gray-900 mb-12">
          Explore the Showcase
        </h2>
        <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
          <.link
            navigate="/tables"
            class="group bg-white rounded-xl shadow-lg p-8 hover:shadow-xl transition-all hover:scale-105"
          >
            <h3 class="text-2xl font-bold text-gray-900 mb-3 group-hover:text-purple-600 transition-colors">
              Table Examples
            </h3>
            <p class="text-gray-600 mb-4">
              See Cinder.Table in action with real data. Explore sorting, pagination, and column customization.
            </p>
            <span class="text-purple-600 font-medium">View examples →</span>
          </.link>

          <.link
            navigate="/themes"
            class="group bg-white rounded-xl shadow-lg p-8 hover:shadow-xl transition-all hover:scale-105"
          >
            <h3 class="text-2xl font-bold text-gray-900 mb-3 group-hover:text-purple-600 transition-colors">
              Theme Gallery
            </h3>
            <p class="text-gray-600 mb-4">
              Browse 8+ built-in themes. Switch between modern, retro, dark, and more with live preview.
            </p>
            <span class="text-purple-600 font-medium">Browse themes →</span>
          </.link>

          <.link
            navigate="/advanced"
            class="group bg-white rounded-xl shadow-lg p-8 hover:shadow-xl transition-all hover:scale-105"
          >
            <h3 class="text-2xl font-bold text-gray-900 mb-3 group-hover:text-purple-600 transition-colors">
              Advanced Features
            </h3>
            <p class="text-gray-600 mb-4">
              Dive into advanced filtering, relationships, real-time updates, and performance optimization.
            </p>
            <span class="text-purple-600 font-medium">Learn more →</span>
          </.link>

          <.link
            href="https://hexdocs.pm/cinder"
            target="_blank"
            class="group bg-white rounded-xl shadow-lg p-8 hover:shadow-xl transition-all hover:scale-105"
          >
            <h3 class="text-2xl font-bold text-gray-900 mb-3 group-hover:text-purple-600 transition-colors">
              Documentation
            </h3>
            <p class="text-gray-600 mb-4">
              Read the full documentation, API reference, and integration guides on HexDocs.
            </p>
            <span class="text-purple-600 font-medium">View docs →</span>
          </.link>
        </div>
      </div>

      <!-- Stats Section -->
      <div class="bg-purple-600 text-white">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-16">
          <div class="grid grid-cols-2 md:grid-cols-4 gap-8 text-center">
            <div>
              <div class="text-4xl font-bold mb-2">6</div>
              <div class="text-purple-200">Ash Resources</div>
            </div>
            <div>
              <div class="text-4xl font-bold mb-2">2,550+</div>
              <div class="text-purple-200">Sample Records</div>
            </div>
            <div>
              <div class="text-4xl font-bold mb-2">8+</div>
              <div class="text-purple-200">Built-in Themes</div>
            </div>
            <div>
              <div class="text-4xl font-bold mb-2">6</div>
              <div class="text-purple-200">Filter Types</div>
            </div>
          </div>
        </div>
      </div>
    </div>
    """
  end

  defp features do
    [
      %{
        icon: "hero-table-cells",
        title: "Smart Tables",
        description: "Automatically generate rich data tables from your Ash resources with zero configuration."
      },
      %{
        icon: "hero-funnel",
        title: "Advanced Filtering",
        description: "Multiple filter types including text, select, date range, boolean, and numeric filters."
      },
      %{
        icon: "hero-arrows-up-down",
        title: "Sorting & Pagination",
        description: "Built-in sorting for all columns with efficient offset and keyset pagination."
      },
      %{
        icon: "hero-paint-brush",
        title: "Beautiful Themes",
        description: "8+ professionally designed themes that can be switched on the fly."
      },
      %{
        icon: "hero-link",
        title: "Relationship Support",
        description: "Seamlessly display and filter by related data with automatic loading."
      },
      %{
        icon: "hero-bolt",
        title: "Real-time Updates",
        description: "LiveView-powered tables that update in real-time with Phoenix PubSub."
      }
    ]
  end
end