# frozen_string_literal: true

# This file should contain all the record creation needed to
# seed the database with its default values.
# The data can then be loaded with the rails db:seed
# command (or created alongside the database with db:setup).
#
# Examples:
#

#   movies = Movie.create([{ name: 'Star Wars' },
# { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

1.upto(30) do |i|
  user = User.new(username: Faker::Internet.username,
                  full_name: Faker::Name.name,
                  email: "test#{i}@test.com",
                  password: '123456', password_confirmation: '123456').save
  redo unless user
end

User.all.each do |user|
  chirp = user.chirps.build(content: Faker::Quote.matz).save
  redo unless chirp
end
