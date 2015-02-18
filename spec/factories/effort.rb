FactoryGirl.define do
  factory :effort do
    sequence(:name){ |n| "effort_#{n}" }
    effort_type 1
    unit '回'
  end
end