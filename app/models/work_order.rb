class WorkOrder < ApplicationRecord
  belongs_to :repair
  has_one :appointment

  before_validation :set_reference, on: :create

  private
  def set_reference
    self.workOrderReference = rand(9999999)
  end
end
