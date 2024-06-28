defmodule Piet.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      PietWeb.Telemetry,
      Piet.Repo,
      {DNSCluster, query: Application.get_env(:piet, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Piet.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Piet.Finch},
      # Start a worker by calling: Piet.Worker.start_link(arg)
      # {Piet.Worker, arg},
      # Start to serve requests, typically the last entry
      PietWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Piet.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PietWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
