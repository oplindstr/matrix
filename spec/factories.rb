FactoryGirl.define do
  factory :user do
    username "joo"
    password "joo"
    password_confirmation "joo"
    firstname "joo"
    admin 1
    activated 1
  end

  factory :user2, class: User do
    username "jooo"
    password "jooo"
    password_confirmation "jooo"
    firstname "jooo"
    admin 0
    activated 1
  end

  factory :user_player, class: Player do
    name 'user_player'
    expectation 1500.0
    deviation 500.0
    user_id 1
  end

  factory :user_player2, class: Player do
    name 'user_player2'
    expectation 1500.0
    deviation 500.0
    user_id 2
  end

  factory :player1, class: Player do
    name "player1"
    expectation 1500.0
    deviation 500.0
  end

  factory :player2, class: Player do
    name "player2"
    expectation 1500.0
    deviation 500.0
  end

  factory :player3, class: Player do
    name "player3"
    expectation 1500.0
    deviation 500.0
  end

  factory :player4, class: Player do
    name "player4"
    expectation 1500.0
    deviation 500.0
  end
end