FactoryBot.define do
  factory :task do
    work_order nil
    sorCode "MyString"
    dueDate "2018-06-20 16:33:08"
    supplierReference "MyString"
    estimatedCost "9.99"
    trade "MyString"
    completedDate "2018-06-20 16:33:08"
    description "MyText"
  end
end
