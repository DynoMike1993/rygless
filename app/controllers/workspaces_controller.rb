class WorkspacesController < ApplicationController
  expose :workspace
  expose :workspaces, -> { current_user.workspaces }
  def index; end

  def new; end

  def create
    if workspace.save
      redirect_to workspaces_path
    else
      redirect_to new_workspace_path
    end
  end

  private

  def workspace_params
    params.require(:workspace).permit(:name).merge(user_id: current_user.id)
  end
end

