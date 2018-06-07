class Repair < ApplicationRecord
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
    }
  end
end
