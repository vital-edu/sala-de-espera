FactoryGirl.define do
  factory :service do
    status 1
    employee
    client
    service_category
    scheduled_time Time.current + 1.day
  end
end
