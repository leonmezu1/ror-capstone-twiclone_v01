FactoryBot.define do
  factory :comment do
    association :user
    association :chirp
    content { 'comment content' }
  end
end
