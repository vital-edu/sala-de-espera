Role.create(name: 'manager')
Role.create(name: 'employee')
Role.create(name: 'client')

ServiceCategory.create(
  name: "Corte de Cabelo",
  description: "Corte de cabelo masculino e feminino.",
  price: 20,
  image: File.new('app/assets/images/service_categories/haircut.jpg'))

ServiceCategory.create(
  name: "Manicure",
  description: "Manicure.",
  price: 15,
  image: File.new('app/assets/images/service_categories/manicure.jpg'))

ServiceCategory.create(
  name: "Pedicure",
  description: "Pedicure.",
  price: 15,
  image: File.new('app/assets/images/service_categories/pedicure.jpg'))

ServiceCategory.create(
  name: "Escova Progressiva",
  description: "Escova progressiva feminina.",
  price: 80,
  image: File.new('app/assets/images/service_categories/progressive_brush.jpg'))

ServiceCategory.create(
  name: "Penteado feminino",
  description: "Penteado feminino para casamentos e outros eventos importantes.",
  price: 60,
  image: File.new('app/assets/images/service_categories/hairstyle.jpg'))
