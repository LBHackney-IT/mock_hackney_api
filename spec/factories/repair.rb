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

    transient do
      work_order_count 1
    end

    after(:create) do |repair, evaluator|
      create_list(:work_order, evaluator.work_order_count, repair: repair)
    end
  end
end
