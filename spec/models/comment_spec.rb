require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { create(:user)  }
  let(:chirp) { create(:chirp)  }
  let(:comment) { build(:comment) }

  after(:each) do
    Comment.destroy_all
    Chirp.destroy_all
    User.destroy_all
  end

  it 'is valid with valid attributes' do
    chirp.user_id = user.id
    comment.user_id = user.id
    expect(comment.valid?).to be(true)
    expect(comment.save).to be(true)
  end

  it 'is invalid with invalid attributes' do
    chirp.user_id = user.id
    comment.user_id = user.id
    comment.content = ''
    expect(comment.valid?).to be(false)
    expect(comment.save).to be(false)
  end

  it 'is invalid with a long content' do
    chirp.user_id = user.id
    comment.user_id = user.id
    comment.content = 'abc' * 500
    expect(comment.valid?).to be(false)
    expect(comment.save).to be(false)
  end

  context 'ActiveRecord Associations' do
    it { should belong_to(:user) }
    it { should belong_to(:chirp) }
  end

  context 'Validations' do
    it { should validate_presence_of(:content) }
    it { should validate_length_of(:content).is_at_least(1) }
    it { should validate_length_of(:content).is_at_most(255) }
  end

end
