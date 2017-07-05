require 'rails_helper'
include TrainingsHelper

RSpec.describe TrainingsController, type: :controller do
  describe '#destroy' do
    subject { delete :destroy, params: { id: training.id } }

    let(:current_user) { FactoryGirl.create(:user)}

    context 'with authorized user' do
      let!(:training) { FactoryGirl.create(:training, created_by: 1)}

      before do
        allow_any_instance_of(described_class).to receive(:can_be_deleted_by_user?).and_return(true)
      end

      it 'can delete their own training' do
        expect { subject }.to change{Training.count}.from(1).to(0)
      end
    end

    context 'when user is not allowed to delete training' do
      let!(:training) { FactoryGirl.create(:training, created_by: 1)}

      before do
        allow_any_instance_of(described_class).to receive(:can_be_deleted_by_user?).and_return(false)
        allow_any_instance_of(described_class).to receive(:current_user).and_return (current_user)
      end

      it 'cannot delete training' do
        expect { subject }.not_to change{Training.count}
      end
    end

  end
end