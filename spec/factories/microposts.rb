FactoryBot.define do
  factory :micropost do
    artist {"led zeppelin"}
    song {"天国への階段"}
    youtube_url {"https://youtu.be/xbhCPt6PZIU"}
    content {"とてもいい曲です！"}
    association :owner

    trait :invalid do
      artist nil
    end
  end
end
