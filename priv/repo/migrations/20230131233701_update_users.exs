defmodule Realworld.Repo.Migrations.UpdateUsers do
  @moduledoc """
  Updates resources based on their most recent snapshots.

  This file was autogenerated with `mix ash_postgres.generate_migrations`
  """

  use Ecto.Migration

  def up do
    alter table(:users) do
      remove :email
    end

    drop_if_exists unique_index(:users, [:email], name: "users_unique_email_index")
  end

  def down do
    create unique_index(:users, [:email], name: "users_unique_email_index")

    alter table(:users) do
      remove :email
      add :email, :text, null: false
    end
  end
end
