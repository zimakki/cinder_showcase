defmodule CinderShowcase.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      CinderShowcaseWeb.Telemetry,
      CinderShowcase.Repo,
      {DNSCluster, query: Application.get_env(:cinder_showcase, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: CinderShowcase.PubSub},
      # Start a worker by calling: CinderShowcase.Worker.start_link(arg)
      # {CinderShowcase.Worker, arg},
      # Start to serve requests, typically the last entry
      CinderShowcaseWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: CinderShowcase.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    CinderShowcaseWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
