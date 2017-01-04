include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :user do
    name 'Rostyslav'
    email 'my@mail.com'
    password 'verysecurepassword'
    password_confirmation 'verysecurepassword'
  end

  factory :placement do
    title 'Hilton'
    sequence(:address) { |n| "#{n} Boyko st." }
    description 'Hilton hotel in New York city'
    price 200

    photos { [Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec',
             'assets', 'ruby.png'))] }
  end

  factory :review do
    title 'Very nice'
    content 'Comfortable beds'
    photos { [Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec',
             'assets', 'ruby.png'))] }

    placement
    user
  end
end
