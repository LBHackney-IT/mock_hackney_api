FactoryBot.define do
  factory :block do
    address "MyString"
    postcode "MyString"
    propertyReference "MyString"
    maintainable false
    estate
    managerName "Bob Smith"
    managerEmail "test@test.com"
    managerPhone "07777777777"
    floors 2
    entranceDoors 1
    lifts 1
    heating 'Mixed'
  end
end
