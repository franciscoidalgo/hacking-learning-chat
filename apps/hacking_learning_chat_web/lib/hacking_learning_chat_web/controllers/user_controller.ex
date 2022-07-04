defmodule HackingLearningChatWeb.UserController do
  use HackingLearningChatWeb, :controller

  def show(conn, %{"id" => id}) do
    user = HackingLearningChat.get_user(id)
    render(conn, "show.html", user: user)
  end

  def new(conn, _params) do
    user = HackingLearningChat.new_user()
    render(conn, "new.html", user: user)
  end

  def create(conn, %{"user" => user_params}) do
    case HackingLearningChat.insert_user(user_params) do
      {:ok, user} -> redirect(conn, to: Routes.user_path(conn, :show, user))
      {:error, user} -> render(conn, "new.html", user: user)
    end
  end
end
