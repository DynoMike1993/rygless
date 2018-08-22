require 'dry/monads/result'
require 'dry/monads/do/all'

class NewUserWorkspacesService
  include Dry::Monads::Result::Mixin
  include Dry::Monads::Do::All
  
  def initialize(user)
    @user = user
  end

  def call
    User.transaction do
      yield validate_user_workspaces
      workspaces = create_workspaces
      create_tasks(workspaces)
      Success('Successfuly created example data!')
    end
  end

  private

  def validate_user_workspaces
    if user.workspaces.length.positive?
      Failure('Workspaces exists!')
    else
      Success
    end
  end

  def create_workspaces
    3.times do |i|
      user.workspaces.create(name: "workexample#{i}")
    end
    if user.workspaces.length == 3
      Success(user.workspaces)
    else
      Failure
    end
  end

  def create_tasks(workspaces)
    workspaces.each do |workspace|
      3.times do |i|
        workspace.tasks.create(name: "taskexample#{i}")
      end
    end
  end

  attr_reader :user, :repo
end
