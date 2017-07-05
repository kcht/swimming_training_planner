require 'rails_helper'

RSpec.describe TrainingsHelper do
  describe '#total_distance' do
    subject(:total_distance) { helper.total_distance(content) }

    context 'when content empty' do
      let(:content) { {} }

      it { is_expected.to eq(0)}
    end

    context 'when content is nil' do
      let(:content) { nil }

      it { is_expected.to eq(0)}
    end

    context 'when content is valid' do
      let(:content) { "100m kraul\n 200m zabka \n 300m delfin" }

      it { is_expected.to eq(600)}
    end

    context 'when content has multiplication using *' do
      let(:content) { "100m kraul\n 2*40m zabka" }

      it { is_expected.to eq(180)}
    end

    context 'when content has multiplication using x' do
      let(:content) { "100m kraul\n 2x40m zabka" }

      it { is_expected.to eq(180)}
    end

    context 'when there are spaces in content' do
      let(:content) { "100 m kraul\n 2 x 40m zabka" }

      it { is_expected.to eq(180)}
    end

    context 'when many numbers in one line' do
      let(:content) { "100m kraul (2x50 szybko wolno)" }

      it { is_expected.to eq(100)}
    end

    context 'when there are lines without numbers' do
      let(:content) { "100m kraul\n something not important \n 500m nogi kraul" }

      it { is_expected.to eq(600)}
    end

    context 'when no numbers in content' do
      let(:content) { "kraul dowolnie\n plywanie wolne" }

      it { is_expected.to eq(0)}
    end

    context 'when numbers are not at the beginning of the line' do
      let(:content) { "zabka: 100m\n kraul: 2x100m" }

      it { is_expected.to eq(300)}
    end


  end
end