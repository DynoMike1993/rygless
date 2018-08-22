class WorkspacePolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def edit?
    user.admin? || user.workspaces.include?(record)
  end

  def update?
    record.created_at.today?
  end
end