FactoryGirl.define do
  factory :user do
    username "joo"
    password "joo"
    password_confirmation "joo"
    name "joo"
    admin 1
    activated 1
  end
end