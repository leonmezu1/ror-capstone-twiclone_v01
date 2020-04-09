require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { build(:user) }
  let(:chirp) { build(:chirp) }

  after(:each) do
    Chirp.destroy_all
    User.destroy_all
  end

  it 'is valid with valid attributes' do
    like = Like.new(chirp: chirp, user: user)
    expect(like.valid?).to be(true)
    expect(like.save).to be(true)
  end

  it 'is invalid with no chirp' do
    like = Like.new(chirp: nil, user: user)
    expect(like.valid?).to be(false)
    expect(like.save).to be(false)
  end

  it 'is invalid with no user' do
    like = Like.new(chirp: chirp, user: nil)
    expect(like.valid?).to be(false)
    expect(like.save).to be(false)
  end

  context 'ActiveRecord Associations' do
    it { should belong_to(:chirp) }
    it { should belong_to(:user) }
  end
end
