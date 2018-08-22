require 'rails_helper'

describe WorkspacePolicy do
  subject { described_class }
  let(:workspace) { build(:workspace) }
  let(:user) { build(:user) }

  permissions :edit? do
    it 'denies access if workspace doesnt belongs to user' do
      expect(subject).not_to permit(user, workspace)
    end

    it 'grants access if workspace bleongs to user' do
      user.workspaces << workspace
      expect(subject).to permit(user, workspace)
    end

    it 'grants acces if user is admin' do
      user.admin = true
      expect(subject).to permit(user, workspace)
    end
  end
end

