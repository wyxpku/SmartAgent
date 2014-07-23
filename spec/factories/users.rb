FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "He#{n}@126.com"}
    password "secret"
    password_confirmation "secret"
  end
end
