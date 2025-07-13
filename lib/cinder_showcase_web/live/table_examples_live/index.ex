defmodule CinderShowcaseWeb.TableExamplesLive.Index do
  use CinderShowcaseWeb, :live_view
  
  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:page_title, "Table Examples - Cinder Showcase")
     |> assign(:examples, table_examples())}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
      <div class="mb-8">
        <h1 class="text-4xl font-bold text-gray-900 mb-4">Table Examples</h1>
        <p class="text-lg text-gray-600">
          Explore how Cinder.Table automatically generates rich data tables from your Ash resources.
          Each example demonstrates different features and configurations.
        </p>
      </div>

      <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
        <div :for={example <- @examples} class="bg-white rounded-lg shadow-md hover:shadow-lg transition-shadow">
          <.link navigate={example.path} class="block p-6 space-y-3">
            <div class="flex items-center justify-between">
              <h3 class="text-xl font-semibold text-gray-900">
                {example.title}
              </h3>
              <.icon name={example.icon} class="h-6 w-6 text-purple-600" />
            </div>
            <p class="text-gray-600">
              {example.description}
            </p>
            <div class="flex flex-wrap gap-2">
              <span :for={feature <- example.features} class="px-2 py-1 bg-purple-100 text-purple-700 text-xs rounded-full">
                {feature}
              </span>
            </div>
            <div class="text-purple-600 font-medium pt-2">
              View example →
            </div>
          </.link>
        </div>
      </div>

      <!-- Feature Overview -->
      <div class="mt-16 bg-gradient-to-r from-purple-50 to-indigo-50 rounded-xl p-8">
        <h2 class="text-2xl font-bold text-gray-900 mb-6">
          Cinder.Table Features
        </h2>
        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
          <div class="space-y-3">
            <h3 class="font-semibold text-gray-900">Core Features</h3>
            <ul class="space-y-2 text-gray-600">
              <li class="flex items-start">
                <.icon name="hero-check-circle" class="h-5 w-5 text-green-500 mr-2 flex-shrink-0 mt-0.5" />
                <span>Automatic column generation from resource attributes</span>
              </li>
              <li class="flex items-start">
                <.icon name="hero-check-circle" class="h-5 w-5 text-green-500 mr-2 flex-shrink-0 mt-0.5" />
                <span>Built-in sorting for all sortable columns</span>
              </li>
              <li class="flex items-start">
                <.icon name="hero-check-circle" class="h-5 w-5 text-green-500 mr-2 flex-shrink-0 mt-0.5" />
                <span>Efficient pagination with offset and keyset strategies</span>
              </li>
              <li class="flex items-start">
                <.icon name="hero-check-circle" class="h-5 w-5 text-green-500 mr-2 flex-shrink-0 mt-0.5" />
                <span>Customizable column display and formatting</span>
              </li>
            </ul>
          </div>
          <div class="space-y-3">
            <h3 class="font-semibold text-gray-900">Advanced Features</h3>
            <ul class="space-y-2 text-gray-600">
              <li class="flex items-start">
                <.icon name="hero-check-circle" class="h-5 w-5 text-green-500 mr-2 flex-shrink-0 mt-0.5" />
                <span>Relationship loading and display</span>
              </li>
              <li class="flex items-start">
                <.icon name="hero-check-circle" class="h-5 w-5 text-green-500 mr-2 flex-shrink-0 mt-0.5" />
                <span>Advanced filtering with multiple filter types</span>
              </li>
              <li class="flex items-start">
                <.icon name="hero-check-circle" class="h-5 w-5 text-green-500 mr-2 flex-shrink-0 mt-0.5" />
                <span>URL state management for bookmarkable views</span>
              </li>
              <li class="flex items-start">
                <.icon name="hero-check-circle" class="h-5 w-5 text-green-500 mr-2 flex-shrink-0 mt-0.5" />
                <span>Real-time updates with Phoenix PubSub</span>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
    """
  end

  defp table_examples do
    [
      %{
        title: "Users Table",
        path: "/tables/users",
        icon: "hero-users",
        description: "Display user data with embedded profile information, status badges, and custom formatting.",
        features: ["Embedded data", "Status badges", "500 records", "Custom columns"]
      },
      %{
        title: "Departments Table",
        path: "/tables/departments",
        icon: "hero-building-office",
        description: "Show departments with budget formatting, head count, and calculated fields.",
        features: ["Currency format", "Calculations", "50 records", "Sorting"]
      },
      %{
        title: "Projects Table",
        path: "/tables/projects",
        icon: "hero-briefcase",
        description: "View projects with relationship data, status indicators, and date formatting.",
        features: ["Relationships", "Status colors", "200 records", "Date format"]
      },
      %{
        title: "Posts Table",
        path: "/tables/posts",
        icon: "hero-document-text",
        description: "Browse posts with author information, view counts, and publication status.",
        features: ["Author relation", "Boolean display", "400 records", "Pagination"]
      }
    ]
  end
end