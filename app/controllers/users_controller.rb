class UsersController < ApplicationController
  def leveling
    @monsters = Monster.all.order(:level)
  end

  def fight_monster
    @monster = Monster.find_by(id: params[:monster_id])
  end

  def example_workspaces
    msg = NewUserWorkspacesService.call(current_user)
    redirect_to root_path, flash: { alert: msg }
  end
end
