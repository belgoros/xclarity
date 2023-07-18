defmodule XClarity.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      XClarityWeb.Telemetry,
      # Start the Ecto repository
      XClarity.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: XClarity.PubSub},
      # Start Finch
      {Finch, name: XClarity.Finch},
      # Start the Endpoint (http/https)
      XClarityWeb.Endpoint
      # Start a worker by calling: XClarity.Worker.start_link(arg)
      # {XClarity.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: XClarity.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    XClarityWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
