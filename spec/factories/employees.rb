FactoryGirl.define do
  factory :employee, class: User do
    name "Brendo"
    email "brendo@mail.com"
    cpf "87784507720"
    rg "425955722"
    score 0
    password "12345678"
    password_confirmation "12345678"
  end
end
