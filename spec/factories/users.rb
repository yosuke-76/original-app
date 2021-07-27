FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {Faker::Internet.unique.free_email}
    password              {'00000000'}
    password_confirmation {password}
  end
end