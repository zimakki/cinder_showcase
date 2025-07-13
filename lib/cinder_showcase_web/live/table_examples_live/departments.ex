defmodule CinderShowcaseWeb.TableExamplesLive.Departments do
  use CinderShowcaseWeb, :live_view
  alias CinderShowcase.Showcase.Department
  alias CinderShowcase.Showcase

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
        <.link navigate="/tables" class="text-purple-600 hover:text-purple-700 font-medium mb-4 inline-block">
          ← Back to examples
        </.link>
        <h1 class="text-4xl font-bold text-gray-900 mb-4">Departments Table</h1>
        <p class="text-lg text-gray-600">
          This example shows how to display departmental data with currency formatting,
          budget calculations, and employee statistics.
        </p>
      </div>

      <div class="bg-white rounded-lg shadow-lg p-6">
        <Cinder.Table.table resource={Department} actor={nil}>
          <:col :let={dept} field="name" filter sort>{dept.name}</:col>
          <:col :let={dept} field="head_count" filter sort>
            {format_head_count(dept.head_count)}
          </:col>
          <:col :let={dept} field="budget" filter sort>
            {format_currency(dept.budget)}
          </:col>
          <:col :let={dept} field="description">
            {format_description(dept.description)}
          </:col>
          <:col :let={dept} field="inserted_at" sort>
            {format_date(dept.inserted_at)}
          </:col>
        </Cinder.Table.table>
      </div>

      <!-- Stats Overview -->
      <div class="mt-8 grid grid-cols-1 md:grid-cols-4 gap-6">
        <div class="bg-white rounded-lg shadow p-6 text-center">
          <div class="text-2xl font-bold text-purple-600">50</div>
          <div class="text-gray-600">Departments</div>
        </div>
        <div class="bg-white rounded-lg shadow p-6 text-center">
          <div class="text-2xl font-bold text-green-600">$156M</div>
          <div class="text-gray-600">Total Budget</div>
        </div>
        <div class="bg-white rounded-lg shadow p-6 text-center">
          <div class="text-2xl font-bold text-blue-600">5,247</div>
          <div class="text-gray-600">Total Employees</div>
        </div>
        <div class="bg-white rounded-lg shadow p-6 text-center">
          <div class="text-2xl font-bold text-orange-600">105</div>
          <div class="text-gray-600">Avg Team Size</div>
        </div>
      </div>

      <!-- Features Used -->
      <div class="mt-8 bg-green-50 rounded-lg p-6">
        <h3 class="text-lg font-semibold text-gray-900 mb-3">Features Demonstrated</h3>
        <ul class="space-y-2 text-gray-700">
          <li class="flex items-start">
            <.icon name="hero-currency-dollar" class="h-5 w-5 text-green-600 mr-2 mt-0.5" />
            <span><strong>Currency Formatting:</strong> Automatic formatting of budget amounts with proper locale</span>
          </li>
          <li class="flex items-start">
            <.icon name="hero-users" class="h-5 w-5 text-green-600 mr-2 mt-0.5" />
            <span><strong>Number Formatting:</strong> Team size with pluralization and formatting</span>
          </li>
          <li class="flex items-start">
            <.icon name="hero-scissors" class="h-5 w-5 text-green-600 mr-2 mt-0.5" />
            <span><strong>Text Truncation:</strong> Long descriptions are automatically truncated</span>
          </li>
          <li class="flex items-start">
            <.icon name="hero-chart-bar" class="h-5 w-5 text-green-600 mr-2 mt-0.5" />
            <span><strong>Data Analysis:</strong> Easy to compare budgets and team sizes across departments</span>
          </li>
        </ul>
      </div>

      <!-- Code Example -->
      <div class="mt-8 bg-gray-900 rounded-lg p-6 overflow-x-auto">
        <h3 class="text-lg font-semibold text-white mb-3">Code Example</h3>
        <pre class="text-sm text-gray-300"><code>{"<Cinder.Table.table resource={Department} actor={nil}>
  <:col :let={dept} field=\"name\" filter sort>{dept.name}</:col>
  <:col :let={dept} field=\"head_count\" filter sort>
    {format_head_count(dept.head_count)}
  </:col>
  <:col :let={dept} field=\"budget\" filter sort>
    {format_currency(dept.budget)}
  </:col>
  <:col :let={dept} field=\"description\">
    {format_description(dept.description)}
  </:col>
  <:col :let={dept} field=\"inserted_at\" sort>
    {format_date(dept.inserted_at)}
  </:col>
</Cinder.Table.table>"}</code></pre>
      </div>
    </div>
    """
  end


  defp format_currency(%Decimal{} = amount) do
    amount
    |> Decimal.to_float()
    |> format_currency()
  end
  defp format_currency(amount) when is_number(amount) do
    Number.Currency.number_to_currency(amount, unit: "$", precision: 0)
  end
  defp format_currency(_), do: "-"

  defp format_head_count(count) when is_integer(count) do
    "#{count} #{if count == 1, do: "person", else: "people"}"
  end
  defp format_head_count(_), do: "-"

  defp format_description(text) when is_binary(text) do
    if String.length(text) > 80 do
      String.slice(text, 0, 77) <> "..."
    else
      text
    end
  end
  defp format_description(_), do: "-"

  defp format_date(%DateTime{} = date) do
    Calendar.strftime(date, "%b %d, %Y")
  end
  defp format_date(_), do: "-"
end