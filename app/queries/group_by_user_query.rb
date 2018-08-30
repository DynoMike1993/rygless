class GroupByUserQuery
  def self.call
    new.call
  end

  def call
    query
  end

  private

  def query
    Workspace.all.group_by(&:user_id)
  end
end