FactoryBot.define do
  factory :estate do
    address "MyString"
    postcode "MyString"
    propertyReference "MyString"
    maintainable false
    managerName "Bob Smith"
    managerEmail "test@test.com"
    managerPhone "07777777777"
  end
end
