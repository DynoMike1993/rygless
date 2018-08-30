class UserActivityQuery
  def initialize(user)
    @user = user
  end

  def call
    ActiveRecord::Base.connection.execute(user_activity)
  end

  private

  def user_activity
    query1 = user.workspaces.where(created_at: Time.current.beginning_of_day..Time.current.end_of_day)
    query2 = Workspace.where(user_id: User.first.id)
    "((#{query1.to_sql}) UNION (#{query2.to_sql}))"
  end

  attr_reader :user
end