class UsersController < ApplicationController
  def show
    @activity = UserActivityQuery.new(current_user).call
    @today_workspace = TodayUserWorkspacesQuery.new(current_user).call
    @join_query = JoinQuery.call
    @group_by_user = GroupByUserQuery.call
  end

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
