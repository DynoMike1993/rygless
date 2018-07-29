class WorkspacePolicy
  attr_reader :user, :record

  def initialize(user:, record:)
    @user = user
    @record = record
  end

  def able_to_edit?
    return true if user.admin?
    user.workspaces.include?(record)
  end
end