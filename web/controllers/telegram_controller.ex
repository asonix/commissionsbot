defmodule Commissionsbot.TelegramController do
  use Commissionsbot.Web, :controller

  def index(conn, %{"update_id" => update_id}=params) do
    require Logger

    case handle_params(params) do
      {:ok, stuff} ->
        Logger.debug stuff
      {:error, error} ->
        Logger.debug error
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
  defp handle_params(%{ "inline_query" => inline_query }) do
    {:error, :unsupported}
  end
  defp handle_params(%{ "chosen_inline_result" => inline_query }) do
    {:error, :unsupported}
  end
  defp handle_params(%{ "callback_query" => inline_query }) do
    {:error, :unsupported}
  end
end
