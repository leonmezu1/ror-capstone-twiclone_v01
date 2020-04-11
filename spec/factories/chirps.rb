FactoryBot.define do
  factory :chirp do
    association :user
    content { 'chirp content' }
  end
end
