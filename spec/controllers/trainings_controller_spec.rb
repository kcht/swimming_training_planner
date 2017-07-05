require 'rails_helper'

RSpec.describe TrainingsController, type: :controller do
  describe '#create' do

    before do
      allow(controller).to receive(:training_params).and_return({title: 'test', content: 'test' })
      end
    it 'auto-fills the created_by field with current user' do
      controller.create

      expect(Training.count).to change.from(0).to(1)
    end
  end
end