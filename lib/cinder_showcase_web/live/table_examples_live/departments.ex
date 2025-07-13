defmodule CinderShowcaseWeb.TableExamplesLive.Departments do
  use CinderShowcaseWeb, :live_view
  alias CinderShowcase.Showcase.Department

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:page_title, "Departments Table - Cinder Showcase")}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
      <div class="mb-8">
        <.link navigate="/tables" class="text-primary hover:text-primary/80 font-medium mb-4 inline-block">
          ← Back to examples
        </.link>
        <h1 class="text-4xl font-bold text-base-content mb-4">Departments Table</h1>
        <p class="text-lg text-base-content/70">
          This example shows how to display departmental data with currency formatting,
          budget calculations, and employee statistics.
        </p>
      </div>

      <div class="bg-base-100 rounded-lg shadow-lg p-6">
        <Cinder.Table.table resource={Department} actor={nil} theme="dark">
          <:col field="name" filter sort>Department</:col>
          <:col field="head_count" filter sort>Head Count</:col>
          <:col field="budget" filter sort>Budget</:col>
          <:col field="description">Description</:col>
          <:col field="inserted_at" sort>Created</:col>
        </Cinder.Table.table>
      </div>

      <!-- Stats Overview -->
      <div class="mt-8 grid grid-cols-1 md:grid-cols-4 gap-6">
        <div class="bg-base-200 rounded-lg shadow p-6 text-center">
          <div class="text-2xl font-bold text-primary">50</div>
          <div class="text-base-content/70">Departments</div>
        </div>
        <div class="bg-base-200 rounded-lg shadow p-6 text-center">
          <div class="text-2xl font-bold text-success">$156M</div>
          <div class="text-base-content/70">Total Budget</div>
        </div>
        <div class="bg-base-200 rounded-lg shadow p-6 text-center">
          <div class="text-2xl font-bold text-info">5,247</div>
          <div class="text-base-content/70">Total Employees</div>
        </div>
        <div class="bg-base-200 rounded-lg shadow p-6 text-center">
          <div class="text-2xl font-bold text-warning">105</div>
          <div class="text-base-content/70">Avg Team Size</div>
        </div>
      </div>

      <!-- Features Used -->
      <div class="mt-8 bg-base-200 rounded-lg p-6">
        <h3 class="text-lg font-semibold text-base-content mb-3">Features Demonstrated</h3>
        <ul class="space-y-2 text-base-content/80">
          <li class="flex items-start">
            <.icon name="hero-currency-dollar" class="h-5 w-5 text-success mr-2 mt-0.5" />
            <span><strong>Currency Formatting:</strong> Automatic formatting of budget amounts with proper locale</span>
          </li>
          <li class="flex items-start">
            <.icon name="hero-users" class="h-5 w-5 text-success mr-2 mt-0.5" />
            <span><strong>Number Formatting:</strong> Team size with pluralization and formatting</span>
          </li>
          <li class="flex items-start">
            <.icon name="hero-scissors" class="h-5 w-5 text-success mr-2 mt-0.5" />
            <span><strong>Text Truncation:</strong> Long descriptions are automatically truncated</span>
          </li>
          <li class="flex items-start">
            <.icon name="hero-chart-bar" class="h-5 w-5 text-success mr-2 mt-0.5" />
            <span><strong>Data Analysis:</strong> Easy to compare budgets and team sizes across departments</span>
          </li>
        </ul>
      </div>

      <!-- Code Example -->
      <div class="mt-8 bg-base-300 rounded-lg p-6 overflow-x-auto">
        <h3 class="text-lg font-semibold text-base-content mb-3">Code Example</h3>
        <pre class="text-sm text-base-content/80"><code>{"<Cinder.Table.table resource={Department} actor={nil}>
  <:col field=\"name\" filter sort>Department</:col>
  <:col field=\"head_count\" filter sort>Head Count</:col>
  <:col field=\"budget\" filter sort>Budget</:col>
  <:col field=\"description\">Description</:col>
  <:col field=\"inserted_at\" sort>Created</:col>
</Cinder.Table.table>"}</code></pre>
      </div>
    </div>
    """
  end


end