require 'rails_helper'
require 'shared/shared_examples_stuff.rb'

describe WorkspacePolicy do
  subject { described_class }
  let(:workspace) { build(:workspace) }
  let(:user) { build(:user) }

  permissions :edit? do
    it 'denies access if workspace doesnt belongs to user' do
      expect(subject).not_to permit(user, workspace)
    end

    context 'workspace bleongs to user' do
      before do
        user.workspaces << workspace
      end
      include_examples 'permit user'
    end

    context 'user is admin' do
      before do
        user.admin = true
      end
      include_examples 'permit user'
    end
  end
end

