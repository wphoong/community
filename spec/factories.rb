FactoryGirl.define do
  factory :comment do
    message "yo"
  end
  
   factory :subcommunity do
    title "hello"
    slogan "Plebs"
  end

  factory :post do
    title "LUL"
    description "LUL"
  end

end