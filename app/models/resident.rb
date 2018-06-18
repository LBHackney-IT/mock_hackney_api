class Resident < ApplicationRecord
  belongs_to :dwelling

  before_validation :set_reference, on: :create

  def as_json(*)
    {
      residentReference: self.residentReference,
      name: self.name,
      last_call: self.last_call,
    }
  end

  private
  def set_reference
    self.residentReference = rand(9999999)
  end
end
