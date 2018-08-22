class WorkspacesController < ApplicationController
  expose :workspace
  expose :workspaces, -> { Workspace.all.decorate }
  def index; end

  def new; end

  def create
    if workspace.save
      redirect_to workspaces_path
    else
      redirect_to new_workspace_path
    end
  end

  def edit
    if policy(workspace).edit?
      render :edit
    else
      render text: 'Not authorized', status: 403
    end
  end

  def update
    authorize workspace
    if workspace.update(workspace_params)
      redirect_to workspaces_path
    else
      render :edit
    end
  end

  private

  def workspace_params
    params.require(:workspace).permit(:name).merge(user_id: current_user.id)
  end

  def user_not_authorized
    flash[:alert] = 'You are not authorized to update it if created at is not today'
    redirect_to workspaces_path
  end

  # def workspace_policy
  #   @workspace_policy ||= WorkspacePolicy.new(user: current_user, record: workspace)
  # end
  # helper_method :workspace_policy
end

