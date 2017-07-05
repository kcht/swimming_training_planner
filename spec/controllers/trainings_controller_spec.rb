require 'rails_helper'

RSpec.describe TrainingsController, type: :controller do
  describe '#destroy' do
    subject { controller.destroy }

    let(:training) { FactoryGirl.create(:training, created_by: 1)}

    context 'with authorized user' do
      let(:current_user) { FactoryGirl.create(:user, id: 1)}

      before do

      end

      it 'can delete their own training' do
        subject
      end
    end

  end
end