class TasksController < ApplicationController
  expose :workspace
  expose :task
  expose :tasks, :workspace_tasks

  def index; end

  def new; end

  def create
    if task.save
      redirect_to workspace_tasks_path(workspace)
    else
      redirect_to new_workspace_task_path(workspace)
    end
  end

  private

  def workspace_tasks
    workspace.tasks
  end

  def task_params
    params.require(:task).permit(:name, :description).merge(user_id: current_user.id, workspace_id: workspace.id)
  end
end