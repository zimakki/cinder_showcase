defmodule CinderShowcaseWeb.TableExamplesLive.Users do
  use CinderShowcaseWeb, :live_view
  alias CinderShowcase.Showcase.User
  alias CinderShowcase.Showcase

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:page_title, "Users Table - Cinder Showcase")}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
      <div class="mb-8">
        <.link navigate="/tables" class="text-purple-600 hover:text-purple-700 font-medium mb-4 inline-block">
          ← Back to examples
        </.link>
        <h1 class="text-4xl font-bold text-gray-900 mb-4">Users Table</h1>
        <p class="text-lg text-gray-600">
          This example demonstrates how Cinder.Table handles user data with embedded profiles,
          status formatting, and custom column rendering.
        </p>
      </div>

      <div class="bg-white rounded-lg shadow-lg p-6">
        <Cinder.Table.table resource={User} actor={nil}>
          <:col :let={user} field="name" filter sort>{user.name}</:col>
          <:col :let={user} field="email" filter sort>{user.email}</:col>
          <:col :let={user} field="status" filter sort>
            <.format_status status={user.status} />
          </:col>
          <:col :let={user} field="profile.location" filter>
            {get_in(user.profile, ["location"]) || "-"}
          </:col>
          <:col :let={user} field="profile.experience_years">
            {format_experience(get_in(user.profile, ["experience_years"]))}
          </:col>
          <:col :let={user} field="profile.skills">
            <.format_skills skills={get_in(user.profile, ["skills"])} />
          </:col>
          <:col :let={user} field="inserted_at" sort>
            {format_date(user.inserted_at)}
          </:col>
        </Cinder.Table.table>
      </div>

      <!-- Features Used -->
      <div class="mt-8 bg-blue-50 rounded-lg p-6">
        <h3 class="text-lg font-semibold text-gray-900 mb-3">Features Demonstrated</h3>
        <ul class="space-y-2 text-gray-700">
          <li class="flex items-start">
            <.icon name="hero-sparkles" class="h-5 w-5 text-blue-600 mr-2 mt-0.5" />
            <span><strong>Embedded Data:</strong> Accessing nested profile fields like location and skills</span>
          </li>
          <li class="flex items-start">
            <.icon name="hero-sparkles" class="h-5 w-5 text-blue-600 mr-2 mt-0.5" />
            <span><strong>Custom Formatting:</strong> Status badges, skill tags, and date formatting</span>
          </li>
          <li class="flex items-start">
            <.icon name="hero-sparkles" class="h-5 w-5 text-blue-600 mr-2 mt-0.5" />
            <span><strong>Sortable Columns:</strong> Name, email, status, and joined date can be sorted</span>
          </li>
          <li class="flex items-start">
            <.icon name="hero-sparkles" class="h-5 w-5 text-blue-600 mr-2 mt-0.5" />
            <span><strong>Pagination:</strong> Navigate through 500 user records efficiently</span>
          </li>
        </ul>
      </div>

      <!-- Code Example -->
      <div class="mt-8 bg-gray-900 rounded-lg p-6 overflow-x-auto">
        <h3 class="text-lg font-semibold text-white mb-3">Code Example</h3>
        <pre class="text-sm text-gray-300"><code>{"<Cinder.Table.table resource={User} actor={nil}>
  <:col :let={user} field=\"name\" filter sort>{user.name}</:col>
  <:col :let={user} field=\"email\" filter sort>{user.email}</:col>
  <:col :let={user} field=\"status\" filter sort>
    <.format_status status={user.status} />
  </:col>
  <:col :let={user} field=\"profile.location\" filter>
    {get_in(user.profile, [\"location\"]) || \"-\"}
  </:col>
  <:col :let={user} field=\"profile.experience_years\">
    {format_experience(get_in(user.profile, [\"experience_years\"]))}
  </:col>
  <:col :let={user} field=\"profile.skills\">
    <.format_skills skills={get_in(user.profile, [\"skills\"])} />
  </:col>
  <:col :let={user} field=\"inserted_at\" sort>
    {format_date(user.inserted_at)}
  </:col>
</Cinder.Table.table>"}</code></pre>
      </div>
    </div>
    """
  end

  attr :status, :atom, required: true
  def format_status(assigns) do
    color = case assigns.status do
      :active -> "bg-green-100 text-green-800"
      :inactive -> "bg-gray-100 text-gray-800"
      :pending -> "bg-yellow-100 text-yellow-800"
      :suspended -> "bg-red-100 text-red-800"
      _ -> "bg-gray-100 text-gray-800"
    end

    assigns = assign(assigns, :color, color)
    
    ~H"""
    <span class={"inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium #{@color}"}>
      {@status}
    </span>
    """
  end

  defp format_experience(years) when is_integer(years) do
    "#{years} #{if years == 1, do: "year", else: "years"}"
  end
  defp format_experience(_), do: "-"

  attr :skills, :list, required: true
  def format_skills(assigns) do
    skills = if is_list(assigns.skills), do: Enum.take(assigns.skills, 3), else: []
    assigns = assign(assigns, :formatted_skills, skills)
    
    ~H"""
    <div class="flex flex-wrap gap-1">
      <span :for={skill <- @formatted_skills} class="inline-flex items-center px-2 py-0.5 rounded text-xs font-medium bg-purple-100 text-purple-800">
        {skill}
      </span>
    </div>
    """
  end

  defp format_date(%DateTime{} = date) do
    Calendar.strftime(date, "%b %d, %Y")
  end
  defp format_date(_), do: "-"
end