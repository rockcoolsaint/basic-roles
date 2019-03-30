FactoryBot.define do
  factory :user do
    email 'foo@bar.com'
    password { 'password' }
    password_confirmation { 'password' }
    role { 'super' }

    trait :basic do
      email 'random@bar.com'
      role { 'basic' }
    end
  end
end