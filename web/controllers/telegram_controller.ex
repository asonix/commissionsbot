defmodule Commissionsbot.TelegramController do
  use Commissionsbot.Web, :controller

  alias Commissionsbot.TelegramUpdate

  def index(conn, %{"update_id" => update_id}=params) do
    require Logger

    if_unique(update_id, fn ->
      case handle_params(params) do
        {:ok, stuff} ->
          Logger.debug stuff
        {:error, error} ->
          Logger.debug error
      end
    end)

    conn
    |> send_resp(204, "")
  end

  defp if_unique(update_id, cb) do
    unless ConCache.get(:commissions_cache, update_id) do
      ConCache.put(:commissions_cache, update_id, true)

      unless Repo.get_by(TelegramUpdate, update_id: update_id) do
        %TelegramUpdate{}
        |> TelegramUpdate.changeset(%{"update_id" => update_id})
        |> Repo.insert

        cb.()
      end
    end
  end

  defp handle_params(%{ "message" => message }) do
    Telegram.Types.Message.from_map(message)
  end
  defp handle_params(%{ "edited_message" => message }) do
    Telegram.Types.Message.from_map(message)
  end
  defp handle_params(%{ "channel_post" => channel_post }) do
    Telegram.Types.Message.from_map(channel_post)
  end
  defp handle_params(%{ "edited_channel_post" => channel_post }) do
    Telegram.Types.Message.from_map(channel_post)
  end
  defp handle_params(%{ "inline_query" => _inline_query }) do
    {:error, :unsupported}
  end
  defp handle_params(%{ "chosen_inline_result" => _inline_query }) do
    {:error, :unsupported}
  end
  defp handle_params(%{ "callback_query" => _inline_query }) do
    {:error, :unsupported}
  end
end
