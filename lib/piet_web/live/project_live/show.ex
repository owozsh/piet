defmodule PietWeb.ProjectLive.Show do
  use PietWeb, :live_view

  alias Piet.Workspace

  @impl true
  def mount(params, _session, socket) do
    tasks = Workspace.list_project_tasks(params[:id])
    socket = socket |> stream(:tasks, tasks)

    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:project, Workspace.get_project!(id))}
  end

  defp page_title(:show), do: "Show Project"
  defp page_title(:edit), do: "Edit Project"
end
