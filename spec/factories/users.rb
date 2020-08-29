FactoryBot.define do
  factory :user, aliases: [:owner] do      
    name { "hoge" }
    sequence(:email) { |n|  "hoge#{n}@hoge.com" }
    password { "password" }
    avatar { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/kitten.jpg')) }
  end
end
