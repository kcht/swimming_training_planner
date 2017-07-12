require 'rails_helper'
require 'timecop'

RSpec.describe TrainingPlanItemsController, type: :controller do
  describe '#finished field' do
    let(:user) {FactoryGirl.create(:user, id: 1)}
    let(:training_plan) {FactoryGirl.create(:training_plan, user_id: user.id)}
    let(:training) {FactoryGirl.create(:training, id: 10)}

    let(:now) {Timecop.freeze(Time.now)}

    describe '#mark_finished' do
      subject {post 'mark_finished', params: {training_item_id: training_item.id}}

      let(:training_item) {FactoryGirl.create(:training_plan_item,
                                              training_plan_id: training_plan.id,
                                              training_id: training.id)}


      context 'when user logged in' do
        it 'changes attributes: date and finished to expected' do
          expect(training_item.finished).to be nil
          expect(training_item.date).to be nil
          subject
          expect(TrainingPlanItem.find(training_item.id).finished).to be true
          expect(TrainingPlanItem.find(training_item.id).date).not_to be nil
          expect(TrainingPlanItem.find(training_item.id).date.to_s).to eq(now.strftime('%Y-%m-%d'))
        end
      end
    end

    describe '#mark_unfinished' do
      subject {post 'mark_unfinished', params: {training_item_id: training_item.id}}

      let(:training_item) {FactoryGirl.create(:training_plan_item,
                                              training_plan_id: training_plan.id,
                                              training_id: training.id,
                                              finished: true, date: now) }


      context 'when user logged in' do
        it 'changes attributes: date and finished to expected' do
          expect(training_item.finished).to be true
          expect(training_item.date).not_to be nil
          subject
          expect(TrainingPlanItem.find(training_item.id).finished).to be false
          expect(TrainingPlanItem.find(training_item.id).date).to be nil
        end
      end
    end
  end
end