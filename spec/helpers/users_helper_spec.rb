require 'rails_helper'


RSpec.describe UsersHelper, type: :helper do
  describe '#users_training_plan' do
    subject(:users_training_plan) { helper.users_training_plan(user.id) }

    context 'if user exists' do
      let!(:user) { FactoryGirl.create(:user, id: 1, name: 'Kasia') }

      context 'if user already has a training plan assigned' do
        let!(:training_plan) { FactoryGirl.create(:training_plan, id: 12, user_id: 1 )}

        it 'returns users training plan' do
          expect(subject).to eq(training_plan)
        end
      end

      context 'when user does not have a training plan assigned'  do
        it 'creates a new training plan for user' do
          expect {subject}.to change{TrainingPlan.count}.from(0).to(1)
        end

        it 'returns training plan with correct user id' do
          subject
          expect(TrainingPlan.last.user_id).to eq(user.id)
        end

        it 'returns training plan with correct user id' do
          subject
          expect(TrainingPlan.last.name).to eq("Default training plan for user Kasia")
        end
      end
    end

    context 'if user does not exits' do
      it 'raises exception' do
        expect{subject}.to raise_error
      end
    end
  end
end
