FactoryBot.define do
  factory :repair do
    repairRequestReference "1234"
    propertyReference  "1234"
    problemDescription "The fan is buzzing"
    priority "N"
  end
end
