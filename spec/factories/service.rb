FactoryGirl.define do
  factory :service do
    status 1
    employee
    service_category
    scheduled_time Time.now + 1.day
  end
end
