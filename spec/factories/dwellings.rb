FactoryBot.define do
  factory :dwelling do
    address "MyString"
    postcode "MyString"
    propertyReference "MyString"
    maintainable false
    sub_block
    floor 1
    heating "Boiler"
    toilets 1
    bathrooms 1
  end
end
