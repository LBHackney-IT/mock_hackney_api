# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Property.create!([
  {
    address: '1 Estate House',
    postcode: 'E5 8TE',
    propertyReference: '000001',
    maintainable: true,
  },
  {
    address: '2 Estate House',
    postcode: 'E5 8TE',
    propertyReference: '000002',
    maintainable: true,
  },
  {
    address: '3 Estate House',
    postcode: 'E5 8TE',
    propertyReference: '000003',
    maintainable: false,
  },
  {
    address: '4 Estate House',
    postcode: 'E5 8TE',
    propertyReference: '000004',
    maintainable: false,
  },
])
