require 'rails_helper'

RSpec.describe TrainingPlanItem, type: :model do
  describe 'newly added trainings have nil status' do
    let!(:user) {FactoryGirl.create(:user, id: 1)}
    let(:training_plan) { FactoryGirl.create(:training_plan, id: 1, user_id: 1)}
    let!(:training) { FactoryGirl.create(:training, id:1) }

    it 'status is nil' do
      item = training_plan.training_plan_items.create(training_id: training.id)
      expect(item.finished).to be nil
    end
  end
end
