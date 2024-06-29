defmodule Piet.WorkspaceTest do
  use Piet.DataCase

  alias Piet.Workspace

  describe "projects" do
    alias Piet.Workspace.Project

    import Piet.WorkspaceFixtures

    @invalid_attrs %{name: nil}

    test "list_projects/0 returns all projects" do
      project = project_fixture()
      assert Workspace.list_projects() == [project]
    end

    test "get_project!/1 returns the project with given id" do
      project = project_fixture()
      assert Workspace.get_project!(project.id) == project
    end

    test "create_project/1 with valid data creates a project" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Project{} = project} = Workspace.create_project(valid_attrs)
      assert project.name == "some name"
    end

    test "create_project/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Workspace.create_project(@invalid_attrs)
    end

    test "update_project/2 with valid data updates the project" do
      project = project_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Project{} = project} = Workspace.update_project(project, update_attrs)
      assert project.name == "some updated name"
    end

    test "update_project/2 with invalid data returns error changeset" do
      project = project_fixture()
      assert {:error, %Ecto.Changeset{}} = Workspace.update_project(project, @invalid_attrs)
      assert project == Workspace.get_project!(project.id)
    end

    test "delete_project/1 deletes the project" do
      project = project_fixture()
      assert {:ok, %Project{}} = Workspace.delete_project(project)
      assert_raise Ecto.NoResultsError, fn -> Workspace.get_project!(project.id) end
    end

    test "change_project/1 returns a project changeset" do
      project = project_fixture()
      assert %Ecto.Changeset{} = Workspace.change_project(project)
    end
  end

  describe "tasks" do
    alias Piet.Workspace.Task

    import Piet.WorkspaceFixtures

    @invalid_attrs %{description: nil, title: nil}

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert Workspace.list_tasks() == [task]
    end

    test "list_project_tasks/0 returns all project tasks" do
      project = project_fixture()
      task = task_fixture(%{project_id: project.id})
      IO.inspect(task)
      assert Workspace.list_project_tasks(task.id) == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert Workspace.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      valid_attrs = %{description: "some description", title: "some title"}

      assert {:ok, %Task{} = task} = Workspace.create_task(valid_attrs)
      assert task.description == "some description"
      assert task.title == "some title"
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Workspace.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      update_attrs = %{description: "some updated description", title: "some updated title"}

      assert {:ok, %Task{} = task} = Workspace.update_task(task, update_attrs)
      assert task.description == "some updated description"
      assert task.title == "some updated title"
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = Workspace.update_task(task, @invalid_attrs)
      assert task == Workspace.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = Workspace.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> Workspace.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = Workspace.change_task(task)
    end
  end
end
