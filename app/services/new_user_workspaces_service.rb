require 'dry/monads/do'
require 'dry/monads/result'

class NewUserWorkspacesService
  include Dry::Monads::Result::Mixin
  include Dry::Monads::Do.for(:call)

  def self.call(user)
    new.call(user)
  end

  def call(user)
    User.transaction do
      yield validate_user_workspaces(user)
      workspaces = yield create_workspaces(user)
      workspaces.each do |workspace|
        yield create_tasks(workspace)
      end
    end
    Success('Successfuly created example data!')
  end

  private

  def validate_user_workspaces(user)
    if user.workspaces.length.positive?
      Failure('Fail')
    else
      Success('Success')
    end
  end

  def create_workspaces(user)
    3.times do |i|
      user.workspaces.create(name: "workexample#{i}")
    end
    if user.workspaces.length == 3
      Success(user.workspaces)
    else
      Failure('Fail')
    end
  end

  def create_tasks(workspace)
    3.times do |i|
      workspace.tasks.create(name: "taskexample#{i}", user_id: workspace.user_id)
    end
    if workspace.tasks.length == 3
      Success('Success')
    else
      Failure('Fail')
    end
  end
end
