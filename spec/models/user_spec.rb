require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  after(:each) do
    User.destroy_all
  end

  it 'is valid with valid attributes' do
    expect(user.valid?).to be(true)
    expect(user.save).to be(true)
  end

  it 'is invalid with invalid username' do
    user.username = ''
    expect(user.valid?).to be(false)
    expect(user.save).to be(false)
  end

  it 'is invalid with a too short username' do
    user.username = 'abc'
    expect(user.valid?).to be(false)
    expect(user.save).to be(false)
  end

  it 'is invalid with a long username' do
    user.username = 'abc' * 100
    expect(user.valid?).to be(false)
    expect(user.save).to be(false)
  end

  it 'is invalid with invalid full_name' do
    user.full_name = ''
    expect(user.valid?).to be(false)
    expect(user.save).to be(false)
  end

  it 'is invalid with a too short full_name' do
    user.full_name = 'abc'
    expect(user.valid?).to be(false)
    expect(user.save).to be(false)
  end

  it 'is invalid with a long full_name' do
    user.full_name = 'abc' * 100
    expect(user.valid?).to be(false)
    expect(user.save).to be(false)
  end

  context 'ActiveRecord Associations' do
    it { should have_many(:chirps) }
    it { should have_many(:comments) }
    it { should have_many(:likes) }
    it { should have_many(:followers) }
    it { should have_many(:followed_users) }
  end

  context 'Validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:full_name) }
    it { should validate_length_of(:username).is_at_least(4) }
    it { should validate_length_of(:full_name).is_at_least(7) }
    it { should validate_length_of(:bio).is_at_most(78), allow_nil: true }
  end
end
