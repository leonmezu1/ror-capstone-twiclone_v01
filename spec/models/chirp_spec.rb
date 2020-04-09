require 'rails_helper'

RSpec.describe Chirp, type: :model do

  let(:chirp) { build(:chirp) }

  after(:each) do
    Chirp.destroy_all
  end

  it 'is valid with valid attributes' do
    expect(chirp.valid?).to be(true)
    expect(chirp.save).to be(true)
  end

  it 'is invalid with invalid attributes' do
    chirp.content = ''
    expect(chirp.valid?).to be(false)
    expect(chirp.save).to be(false)
  end

  it 'is invalid with a long content' do
    chirp.content = 'abc' * 500
    expect(chirp.valid?).to be(false)
    expect(chirp.save).to be(false)
  end

  context 'ActiveRecord Associations' do
    it { should have_many(:comments) }
    it { should have_many(:likes) }
    it { should belong_to(:user) }
  end

  context 'Validations' do
    it { should validate_presence_of(:content) }
    it { should validate_length_of(:content).is_at_least(1) }
    it { should validate_length_of(:content).is_at_most(255) }
  end

end
