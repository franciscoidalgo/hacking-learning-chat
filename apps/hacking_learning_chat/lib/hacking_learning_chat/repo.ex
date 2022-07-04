defmodule HackingLearningChat.Repo do
  use Ecto.Repo,
    otp_app: :hacking_learning_chat,
    adapter: Ecto.Adapters.Postgres
end
