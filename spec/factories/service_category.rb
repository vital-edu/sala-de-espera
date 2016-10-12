FactoryGirl.define do
  factory :service_category do
    name 'Corte de Cabelo'
    description 'Corte de cabelo masculino ou feminino'
    price '10.00'
    image do
      Rack::Test::UploadedFile.new('spec/support/images/test.png', 'image/png')
    end
  end
end
