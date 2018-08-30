class JoinQuery
  def self.call
    new.call
  end

  def call
    query
  end

  private

  def query
    User.joins(:tasks)
  end

  attr_reader :user
end