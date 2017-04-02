defmodule Commissionsbot.Repo.Migrations.CreateTelegramUpdate do
  use Ecto.Migration

  def change do
    create table(:telegram_updates) do
      add :update_id, :integer

      timestamps()
    end
    create unique_index(:telegram_updates, [:update_id])

  end
end
