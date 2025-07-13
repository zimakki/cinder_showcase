defmodule CinderShowcaseWeb.TableExamplesLive.Users do
  use CinderShowcaseWeb, :live_view
  alias CinderShowcase.Showcase.User

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
        <.link navigate="/tables" class="text-primary hover:text-primary/80 font-medium mb-4 inline-block">
          ← Back to examples
        </.link>
        <h1 class="text-4xl font-bold text-base-content mb-4">Users Table</h1>
        <p class="text-lg text-base-content/70">
          This example demonstrates how Cinder.Table handles user data with embedded profiles,
          status formatting, and custom column rendering.
        </p>
      </div>

      <div class="bg-base-100 rounded-lg shadow-lg p-6">
        <Cinder.Table.table resource={User} actor={nil} theme="dark">
          <:col field="name" filter sort>Name</:col>
          <:col field="email" filter sort>Email</:col>
          <:col field="status" filter sort>Status</:col>
          <:col field="profile__location" filter>Location</:col>
          <:col field="profile__experience_years">Experience</:col>
          <:col field="profile__skills">Skills</:col>
          <:col field="inserted_at" sort>Joined</:col>
        </Cinder.Table.table>
      </div>

      <!-- Features Used -->
      <div class="mt-8 bg-base-200 rounded-lg p-6">
        <h3 class="text-lg font-semibold text-base-content mb-3">Features Demonstrated</h3>
        <ul class="space-y-2 text-base-content/80">
          <li class="flex items-start">
            <.icon name="hero-sparkles" class="h-5 w-5 text-primary mr-2 mt-0.5" />
            <span><strong>Embedded Data:</strong> Accessing nested profile fields like location and skills</span>
          </li>
          <li class="flex items-start">
            <.icon name="hero-sparkles" class="h-5 w-5 text-primary mr-2 mt-0.5" />
            <span><strong>Custom Formatting:</strong> Status badges, skill tags, and date formatting</span>
          </li>
          <li class="flex items-start">
            <.icon name="hero-sparkles" class="h-5 w-5 text-primary mr-2 mt-0.5" />
            <span><strong>Sortable Columns:</strong> Name, email, status, and joined date can be sorted</span>
          </li>
          <li class="flex items-start">
            <.icon name="hero-sparkles" class="h-5 w-5 text-primary mr-2 mt-0.5" />
            <span><strong>Pagination:</strong> Navigate through 500 user records efficiently</span>
          </li>
        </ul>
      </div>

      <!-- Code Example -->
      <div class="mt-8 bg-base-300 rounded-lg p-6 overflow-x-auto">
        <h3 class="text-lg font-semibold text-base-content mb-3">Code Example</h3>
        <pre class="text-sm text-base-content/80"><code>{"<Cinder.Table.table resource={User} actor={nil}>
  <:col field=\"name\" filter sort>Name</:col>
  <:col field=\"email\" filter sort>Email</:col>
  <:col field=\"status\" filter sort>Status</:col>
  <:col field=\"profile__location\" filter>Location</:col>
  <:col field=\"profile__experience_years\">Experience</:col>
  <:col field=\"profile__skills\">Skills</:col>
  <:col field=\"inserted_at\" sort>Joined</:col>
</Cinder.Table.table>"}</code></pre>
      </div>
    </div>
    """
  end

end