defmodule Proca.Repo.Migrations.CreateConsents do
  use Ecto.Migration

  def change do
    create table(:consents) do
      add :given_at, :naive_datetime, null: false
      add :communication, :boolean, default: false, null: false
      add :delivery, :boolean, default: false, null: false
      add :scopes, {:array, :string}
      add :contact_id, references(:contacts, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:consents, [:contact_id])
  end
end
