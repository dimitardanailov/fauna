require 'rails_helper'

RSpec.describe Door::Actions::Lock, type: :model do
  let(:backend) { Rails.application.config.door_status_manager.backend }

  it_behaves_like 'door action'

  describe 'authorization' do
    it 'is creatable by plain users' do
      expect(subject).to be_creatable_by create(:user)
    end
  end

  describe '#backend_method' do
    it 'returns :lock!' do
      expect(subject.backend_method).to eq :lock!
    end
  end
end
