# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
estate = Estate.create!(
  address: 'Hackney Estate',
  postcode: 'E5 8TE',
  propertyReference: 'E00001',
  managerName: 'Bob Smith',
  managerPhone: '07777777777',
  managerEmail: 'test@test.com',
)
block = Block.create!(
  address: 'Estate House',
  postcode: 'E5 8TE',
  propertyReference: 'B00001',
  estate: estate,
  managerName: 'Bob Smith',
  managerPhone: '07777777777',
  managerEmail: 'test@test.com',
  floors: 2,
  entranceDoors: 1,
  lifts: 1,
  heating: 'Mixed',
)
sub_block1 = SubBlock.create!(
  address: '1-2 Estate House',
  postcode: 'E5 8TE',
  propertyReference: 'S00001',
  block: block,
)
sub_block2 = SubBlock.create!(
  address: '1-2 Estate House',
  postcode: 'E5 8TE',
  propertyReference: 'S00002',
  block: block,
)
Dwelling.create!([
  {
    address: '1 Estate House',
    postcode: 'E5 8TE',
    propertyReference: '000001',
    maintainable: true,
    sub_block: sub_block1,
  },
  {
    address: '2 Estate House',
    postcode: 'E5 8TE',
    propertyReference: '000002',
    maintainable: true,
    sub_block: sub_block1,
  },
  {
    address: '3 Estate House',
    postcode: 'E5 8TE',
    propertyReference: '000003',
    maintainable: false,
    sub_block: sub_block2,
  },
  {
    address: '4 Estate House',
    postcode: 'E5 8TE',
    propertyReference: '000004',
    maintainable: false,
    sub_block: sub_block2,
  },
])
