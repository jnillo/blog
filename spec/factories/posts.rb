FactoryGirl.define do
  factory :post do
    title 'title post'
    content 'Content of this comment'
    author 'John Doe'
    resume 'Resume of post'
    published 3.days.ago
  end
end
