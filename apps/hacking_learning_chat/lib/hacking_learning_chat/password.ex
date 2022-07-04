defmodule HackingLearningChat.Password do
  def hash(password) do
    Argon2.hash_pwd_salt(password)
  end

  def verify_with_hash(password, hash) do
    Argon2.verify_pass(password, hash)
  end

  def dummy_verify() do
    Argon2.no_user_verify()
  end
end
