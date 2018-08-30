RSpec.shared_context 'user with workspaces' do
  let(:user) { create(:user) }
  before do
    3.times do |i|
      user.workspaces.create(name: "workspace#{i}")
    end
  end

  def remove_workspaces
    user.workspaces.destroy_all
  end
end