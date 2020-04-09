FactoryBot.define do
    factory :following do
        association :user
        association :follower
    end
end