require 'rails_helper'
include UsersHelper

RSpec.describe TrainingPlansController, type: :controller do
  describe '#add_training' do
    subject { post 'add_training', params: {training_id: 1}  }

    context 'when user not logged in' do
      it 'is redirected to login' do
        expect(subject).to  redirect_to(new_user_session_path)
      end
    end
  end
end