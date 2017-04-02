defmodule Commissionsbot.TelegramUpdateTest do
  use Commissionsbot.ModelCase

  alias Commissionsbot.TelegramUpdate

  @valid_attrs %{update_id: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = TelegramUpdate.changeset(%TelegramUpdate{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = TelegramUpdate.changeset(%TelegramUpdate{}, @invalid_attrs)
    refute changeset.valid?
  end
end
