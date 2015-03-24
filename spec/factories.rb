FactoryGirl.define do  factory :admin do
    
  end

  factory :location do
    name Faker::Address.street_name
    latitude Faker::Address.latitude
    longitude Faker::Address.longitude
  end

  factory :story do
    date Faker::Date.backward(20000)
    title Faker::Hacker.noun
    description Faker::Hacker.say_something_smart
    storyteller Faker::Name.name
    audio_file_name "test.mp3"
    audio_content_type "audio/mpeg"
    audio_file_size 32000
    audio_updated_at DateTime.now
    location
  end
end

