require 'rails_helper'

RSpec.describe Search, type: :model do
  subject { Search.new }

  it { is_expected.to be_a(Search) }

  describe '.history WIP' do
    let(:keyword) { create(:search).keyword }

    it 'returns an array of keyword and datetime' do
      expect(described_class.history(keyword).first).to include(keyword)
    end
  end

  describe '#query' do
    let(:search) { create(:search) }

    it 'is valid' do
      expect(search).to be_valid
    end

    it 'validates presense of name' do
      expect(search).to validate_presence_of(:keyword)
    end
  end
end
