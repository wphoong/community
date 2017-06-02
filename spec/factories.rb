FactoryGirl.define do
  factory :subscription do
    association :subcommunity
    association :user
  end

  factory :user do
    sequence :email do |n|
      "dummyEmail#{n}@gmail.com"
    end
    password "secretPassword"
    password_confirmation "secretPassword"
  end

  factory :comment do
    message "yo"

    association :post
    association :user
  end
  
   factory :subcommunity do
    title "hello"
    slogan "Plebs"

    association :user
  end

  factory :post do
    title "LUL"
    description "LUL"

    association :subcommunity
    association :user
  end

end