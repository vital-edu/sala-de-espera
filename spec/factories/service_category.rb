FactoryGirl.define do
  factory :service_category do
    name "Corte de Cabelo"
    description "Corte de cabelo masculino ou feminino"
    price "10.00"
    image { File.new("#{Rails.root}/spec/support/images/test.png") }
  end
end
