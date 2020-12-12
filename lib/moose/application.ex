# Copyright 2022 Clivern. All rights reserved.
# Use of this source code is governed by the MIT
# license that can be found in the LICENSE file.

defmodule Moose.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  use Supervisor

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Moose.Repo,
      # Start the Telemetry supervisor
      MooseWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Moose.PubSub},
      # Start the Endpoint (http/https)
      MooseWeb.Endpoint
      # Start a worker by calling: Moose.Worker.start_link(arg)
      # {Moose.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Moose.Supervisor]

    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MooseWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
