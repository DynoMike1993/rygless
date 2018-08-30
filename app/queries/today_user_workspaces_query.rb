class TodayUserWorkspacesQuery
  def initialize(user)
    @user = user
  end

  def call
    today_workspaces
  end

  private

  def today_workspaces
    user
      .workspaces.where(created_at: Time.current.beginning_of_day..Time.current.end_of_day).group_by(&:name)
  end

  attr_reader :user
end
