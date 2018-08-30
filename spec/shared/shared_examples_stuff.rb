RSpec.shared_examples 'permit user' do
  it 'permits user' do
    expect(subject).to permit(user, workspace)
  end
end