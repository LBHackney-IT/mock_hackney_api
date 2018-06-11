class Repair < ApplicationRecord
  has_many :work_orders

  before_validation :set_reference, on: :create

  validates :repairRequestReference, presence: true
  validates :propertyReference, presence: true
  validates :problemDescription, presence: true
  validates :priority, presence: true

  def update_contact_details(contact_params)
    contact_params.each_pair do |key, value|
      write_attribute("contact_#{key}", value)
    end
  end

  def as_json(*)
    {
      repairRequestReference: self.repairRequestReference,
      propertyReference: self.propertyReference,
      problemDescription: self.problemDescription,
      priority: self.priority,
      contact: {
        name: self.contact_name,
        telephoneNumber: self.contact_telephoneNumber,
        emailAddress: self.contact_emailAddress,
        callbackTime: self.contact_callbackTime,
      },
      workOrders: work_orders.collect do |work_order|
        {
          workOrderReference: work_order.workOrderReference,
          sorCode: work_order.sorCode,
          supplierReference: work_order.supplierReference,
        }
      end
    }
  end

  private
  def set_reference
    self.repairRequestReference = rand(9999999)
  end
end
