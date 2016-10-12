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

  factory :match, class: Match do
    player1 1
    player2 2
    player3 3
    player4 4
    winners 0
  end

  factory :event do
    name "tapahtuma"
    starttime Time.now
    location "kumpula"
    price 0
    descr "paras"
  end

  factory :event2, class: Event do
    name "tapahtuma"
    starttime Time.now + 1.day
    location "kumpula"
    price 0
    descr "paras"
    signup_limit 5
    signup_required true
    signup_start Time.now
    signup_end Time.now + 1.day
    signup_cancellable_until Time.now + 1.day
  end

  factory :event3, class: Event do
    name "tapahtuma"
    starttime Time.now + 2.days
    location "kumpula"
    price 0
    descr "paras"
    signup_limit 5
    signup_required true
    signup_start Time.now + 1.day
    signup_end Time.now + 2.days
    signup_cancellable_until Time.now + 1.day
  end

  factory :event4, class: Event do
    name "tapahtuma"
    starttime Time.now + 2.days
    location "kumpula"
    price 0
    descr "paras"
    signup_limit 5
    signup_required true
    signup_start Time.now
    signup_end Time.now + 2.days
    signup_cancellable_until Time.now
  end
end