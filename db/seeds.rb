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
dwelling1 = Dwelling.create!(
  address: '1 Estate House',
  postcode: 'E5 8TE',
  propertyReference: '000001',
  maintainable: true,
  sub_block: sub_block1,
  floor: 1,
  heating: 'Boiler',
  toilets: 1,
  bathrooms: 1,
)
dwelling2 = Dwelling.create!(
  address: '2 Estate House',
  postcode: 'E5 8TE',
  propertyReference: '000002',
  maintainable: true,
  sub_block: sub_block1,
)
dwelling3 = Dwelling.create!(
  address: '3 Estate House',
  postcode: 'E5 8TE',
  propertyReference: '000003',
  maintainable: false,
  sub_block: sub_block2,
)
dwelling4 = Dwelling.create!(
  address: '4 Estate House',
  postcode: 'E5 8TE',
  propertyReference: '000004',
  maintainable: false,
  sub_block: sub_block2,
)
Resident.create!(
  name: "Bob Smith",
  last_call: 5.days.ago,
  dwelling: dwelling1,
)
Resident.create!(
  name: "Jane Smith",
  dwelling: dwelling1,
)
Resident.create!(
  name: "Bob Doe",
  last_call: 900.days.ago,
  dwelling: dwelling2,
)
repair1 = Repair.create!(
  propertyReference: dwelling1.propertyReference,
  problemDescription: "Broken light",
  priority: 'I',
  contact_name: 'Bob Smith',
  contact_telephoneNumber: '07777777777',
  contact_emailAddress: 'bob@test.com',
)
repair2 = Repair.create!(
  propertyReference: dwelling1.propertyReference,
  problemDescription: "Leak",
  priority: 'E',
  contact_name: 'Jane Smith',
  contact_telephoneNumber: '07777777777',
  contact_emailAddress: 'jane@test.com',
)
repair3 = Repair.create!(
  propertyReference: dwelling1.propertyReference,
  problemDescription: "Mould",
  priority: 'I',
  contact_name: 'Bob Smith',
  contact_telephoneNumber: '07777777777',
  contact_emailAddress: 'bob@test.com',
)
repair4 = Repair.create!(
  propertyReference: dwelling2.propertyReference,
  problemDescription: "Broken light",
  priority: 'I',
  contact_name: 'Bob Doe',
  contact_telephoneNumber: '07777777777',
  contact_emailAddress: 'bob@test.com',
)
work_order1 = WorkOrder.create!(
  repair: repair1,
  sorCode: '20040020',
  supplierReference: 'W1',
  workOrderReference: '9000000',
  estimatedCost: 9.99,
  repairType: 'Community Hall Repairs',
  status: 'Completed',
  dueDate: 5.days.ago,
  expectedCompletion: 6.days.ago,
  attendedDate: 6.days.ago,
  attendedBy: 'Geoff Smith',
  outcome: 'Job Physically Complete',
  cancelledDate: nil
)
task1 = Task.create!(
  work_order: work_order1,
  sorCode: '20040020',
  supplierReference: 'W1',
  estimatedCost: 9.99,
  trade: 'PLM',
  completedDate: 6.days.ago,
  dueDate: 5.days.ago,
  description: 'Repair/ease and adjust any door, ease furniture, oil locks, hinges, leave in working order including replacement [straight swap not requiring repair to door] of up to two of the following. Incliuding take off/refix door if required. Medium steel butt hinges, rim latch, mortice latch, rebated mortice latch, night latch, mortice dead lock, lever furniture, overhead door closer, perko door closer. Gerda lock change - excluding work to additional doors, door replacement, re-hang on opposite way, replace threshold. Make good decorations restricted to Primed'
)
work_order2 = WorkOrder.create!(
  repair: repair2,
  sorCode: '20090190',
  supplierReference: 'W1',
  workOrderReference: '9000001',
  estimatedCost: 19.99,
  repairType: 'Community Hall Repairs',
  status: 'Cancelled',
  dueDate: 5.days.ago,
  expectedCompletion: 6.days.ago,
  attendedDate: 6.days.ago,
  attendedBy: 'Geoff Smith',
  outcome: 'Job Physically Complete',
  cancelledDate: nil
)
task2 = Task.create!(
  work_order: work_order1,
  sorCode: '20040020',
  supplierReference: 'W1',
  estimatedCost: 9.99,
  trade: 'PLM',
  completedDate: 6.days.ago,
  dueDate: 5.days.ago,
  description: 'Repair/ease and adjust any door, ease furniture, oil locks, hinges, leave in working order including replacement [straight swap not requiring repair to door] of up to two of the following. Incliuding take off/refix door if required. Medium steel butt hinges, rim latch, mortice latch, rebated mortice latch, night latch, mortice dead lock, lever furniture, overhead door closer, perko door closer. Gerda lock change - excluding work to additional doors, door replacement, re-hang on opposite way, replace threshold. Make good decorations restricted to Primed'
)
task3 = Task.create!(
  work_order: work_order1,
  sorCode: '20040020',
  supplierReference: 'W1',
  estimatedCost: 10,
  trade: 'PLM',
  completedDate: 6.days.ago,
  dueDate: 5.days.ago,
  description: 'Repair/ease and adjust any door, ease furniture, oil locks, hinges, leave in working order including replacement [straight swap not requiring repair to door] of up to two of the following. Incliuding take off/refix door if required. Medium steel butt hinges, rim latch, mortice latch, rebated mortice latch, night latch, mortice dead lock, lever furniture, overhead door closer, perko door closer. Gerda lock change - excluding work to additional doors, door replacement, re-hang on opposite way, replace threshold. Make good decorations restricted to Primed'
)
work_order3 = WorkOrder.create!(
  repair: repair1,
  sorCode: '20040020',
  supplierReference: 'W1',
  workOrderReference: '9000000',
  estimatedCost: 9.99,
  repairType: 'Community Hall Repairs',
  status: 'Completed',
  dueDate: 5.days.ago,
  expectedCompletion: 6.days.ago,
  attendedDate: 6.days.ago,
  attendedBy: 'Geoff Smith',
  outcome: 'Job Physically Complete',
  cancelledDate: nil
)
task4 = Task.create!(
  work_order: work_order3,
  sorCode: '20040020',
  supplierReference: 'W1',
  estimatedCost: 9.99,
  trade: 'PLM',
  completedDate: 6.days.ago,
  dueDate: 5.days.ago,
  description: 'Repair/ease and adjust any door, ease furniture, oil locks, hinges, leave in working order including replacement [straight swap not requiring repair to door] of up to two of the following. Incliuding take off/refix door if required. Medium steel butt hinges, rim latch, mortice latch, rebated mortice latch, night latch, mortice dead lock, lever furniture, overhead door closer, perko door closer. Gerda lock change - excluding work to additional doors, door replacement, re-hang on opposite way, replace threshold. Make good decorations restricted to Primed'
)
