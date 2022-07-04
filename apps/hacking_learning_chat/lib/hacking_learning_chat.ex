defmodule HackingLearningChat do
  @moduledoc """
  HackingLearningChat keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  alias HackingLearningChat.{Repo, User, Password}

  def get_user(id) do
    Repo.get!(User, id)
  end

  def new_user do
    User.changeset_with_password(%User{})
  end

  def insert_user(params) do
    %User{}
    |> User.changeset_with_password(params)
    |> Repo.insert()
  end

  def get_user_by_username_and_password(username, password) do
    with user when not is_nil(user) <- Repo.get_by(User, %{username: username}),
         true <- Password.verify_with_hash(password, user.hashed_password) do
      user
    else
      _ -> Password.dummy_verify()
    end
  end
end
