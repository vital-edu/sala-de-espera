FactoryGirl.define do
  factory :employee_role, class: Role do
    name 'employee'
  end

  factory :manager_role, class: Role do
    name 'manager'
  end

  factory :client_role, class: Role do
    name 'client'
  end
end
