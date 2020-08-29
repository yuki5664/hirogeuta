FactoryBot.define do
  factory :comment do
    body  {"いい曲ですね"}
    association :micropost
    user { micropost.owner }
  end
end
