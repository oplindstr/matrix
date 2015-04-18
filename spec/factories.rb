FactoryGirl.define do
  factory :user do
    username "joo"
    password "joo"
    password_confirmation "joo"
    name "joo"
    admin 1
    activated 1
  end

  factory :user2, class: User do
    username "jooo"
    password "jooo"
    password_confirmation "jooo"
    name "jooo"
    admin 0
    activated 1
  end
end