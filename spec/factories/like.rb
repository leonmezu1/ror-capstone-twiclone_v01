FactoryBot.define do
    factory :like do
        association :user
        association :chirp
    end
end