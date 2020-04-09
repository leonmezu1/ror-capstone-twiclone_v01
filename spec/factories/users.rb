require 'faker'

FactoryBot.define do
    factory :user do
        username { Faker::Internet.unique.username(specifier: 5..8, separators: '') }
        full_name { 'Leonardo Mezu' }
        email { Faker::Internet.unique.email }
        password { '1234567' }
        password_confirmation { '1234567' }
        bio { 'Hey this is my bio' }
    end
end