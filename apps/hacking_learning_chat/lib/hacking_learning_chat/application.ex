defmodule HackingLearningChat.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      HackingLearningChat.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: HackingLearningChat.PubSub}
      # Start a worker by calling: HackingLearningChat.Worker.start_link(arg)
      # {HackingLearningChat.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: HackingLearningChat.Supervisor)
  end
end
