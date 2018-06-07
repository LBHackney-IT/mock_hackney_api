class WorkOrder < ApplicationRecord
  belongs_to :repair

  before_create :set_reference

  private
  def set_reference
    self.workOrderReference = rand(9999999)
  end
end
