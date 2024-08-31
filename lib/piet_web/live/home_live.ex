defmodule PietWeb.HomeLive do
  use PietWeb, :live_view

  def render(assigns) do
    ~H"""
    <p>Hi</p>
    """
  end

  def mount(_, _, socket) do
    {:ok, socket}
  end
end
