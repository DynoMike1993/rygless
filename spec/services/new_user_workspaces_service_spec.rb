require 'rails_helper'
require 'shared/shared_context_stuff.rb'
require 'dry/monads/result'

describe NewUserWorkspacesService do
  describe '#call' do
    include_context 'user with workspaces'
    subject { NewUserWorkspacesService.call(user) }

    it 'returns failure object' do
      expect(subject.failure?).to be true
    end

    it 'return success object' do
      remove_workspaces
      expect(subject.success?).to be true
    end
  end
end
