require 'rails_helper'

RSpec.describe TrainingPlanItemsHelper, type: :helper do
  let(:training1) { FactoryGirl.create(:training, total_distance: 100)}
  let(:training2) { FactoryGirl.create(:training, total_distance: 11)}

  let(:pending_training_item) { FactoryGirl.create(:training_plan_item,
                                                   training_plan_id: training_plan.id,
                                                   training_id: training1.id,
                                                   finished: false)}
  let(:finished_training_item1) { FactoryGirl.create(:training_plan_item,
                                                     training_plan_id: training_plan.id,
                                                     training_id: training1.id,
                                                     finished: true)}
  let(:finished_training_item2) { FactoryGirl.create(:training_plan_item,
                                                     training_plan_id: training_plan.id,
                                                     training_id: training2.id,
                                                     finished: true)}

  let(:training_plan) {FactoryGirl.create(:training_plan, user_id: user.id)}
  let(:user) {FactoryGirl.create(:user)}
  describe '#total_distance_in_completed_trainings' do
    subject { helper.total_distance_in_completed_trainings(trainings) }

    context 'when no trainings at all' do
      let(:trainings) { [] }

      it { is_expected.to eq(0) }
    end

    context 'when no trainings are completed' do
      let(:trainings) { [pending_training_item ]}

      it { is_expected.to eq(0) }
    end

    context 'when some trainings are completed' do
      let(:trainings) { [pending_training_item, finished_training_item1, finished_training_item2] }

      it { is_expected.to eq(111) }
    end
  end

  describe '#total_number_of_completed_trainings' do
    subject { helper.total_number_of_completed_trainings(trainings) }

    context 'when no trainings at all' do
      let(:trainings) { [] }

      it { is_expected.to eq(0) }
    end

    context 'when no trainings are completed' do
      let(:trainings) { [pending_training_item ]}

      it { is_expected.to eq(0) }
    end

    context 'when some trainings are completed' do
      let(:trainings) { [pending_training_item, finished_training_item1, finished_training_item2] }

      it { is_expected.to eq(2) }
    end
  end
end