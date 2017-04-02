defmodule Commissionsbot.TelegramUpdate do
  use Commissionsbot.Web, :model

  schema "telegram_updates" do
    field :update_id, :integer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:update_id])
    |> validate_required([:update_id])
    |> unique_constraint(:update_id)
  end
end
