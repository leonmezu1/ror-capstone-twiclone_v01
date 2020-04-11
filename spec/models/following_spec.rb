require 'rails_helper'
require 'faker'

RSpec.describe Following, type: :model do
  let(:user1) do
    User.create(
      username: Faker::Internet.unique.username(specifier: 5..8, separators: ''),
      full_name: 'Leonardo David',
      email: Faker::Internet.unique.email,
      password: 'password',
      password_confirmation: 'password'
    )
  end

  let(:user2) do
    User.create(
      username: Faker::Internet.unique.username(specifier: 5..8, separators: ''),
      full_name: 'David Leonardo',
      email: Faker::Internet.unique.email,
      password: 'password',
      password_confirmation: 'password'
    )
  end

  it 'is valid with valid attributes' do
    following = Following.create(user: user1, follower: user2)
    expect(following.valid?).to be(true)
    expect(following.save).to be(true)
  end

  it 'is invalid with invalid attributes' do
    user = nil
    following = Following.create(user: user, follower: user2)
    expect(following.valid?).to be(false)
    expect(following.save).to be(false)
  end

  context 'ActiveRecord Associations' do
    it { should belong_to(:user) }
    it { should belong_to(:follower) }
  end
end
