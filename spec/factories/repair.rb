FactoryBot.define do
  factory :repair do
    repairRequestReference "1234"
    propertyReference  "1234"
    problemDescription "The fan is buzzing"
    priority "N"
    contact_name "Contact Name"
    contact_telephoneNumber "77777777777"
    contact_emailAddress "test@test.com"
    contact_callbackTime "morning"
  end
end
