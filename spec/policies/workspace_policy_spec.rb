require 'rails_helper'

describe WorkspacePolicy do
  subject { described_class.new(params).able_to_edit? }

  context 'denies access if workspace doesnt belongs to user' do
    let(:params) { { user: build(:user), record: build(:workspace) } }

    it { is_expected.to be false }
  end

  context 'grants access if workspace bleongs to user' do
    let(:workspace) { build(:workspace) }
    let(:params) { { user: build(:user, workspaces: [workspace]), record: workspace } }

    it { is_expected.to be true }
  end

  context 'grants acces if user is admin' do
    let(:workspace) { build(:workspace) }
    let(:params) { { user: build(:user, :admin, workspaces: [workspace]), record: workspace } }

    it { is_expected.to be true }
  end
end

