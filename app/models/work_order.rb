class WorkOrder < ApplicationRecord
  belongs_to :repair
  has_one :appointment
  has_many :tasks
  has_many :notes, as: :target

  before_validation :set_reference, on: :create

  def as_json(*)
    {
      sorCode: self.sorCode,
      supplierReference: self.supplierReference,
      workOrderReference: self.workOrderReference,
      estimatedCost: self.estimatedCost,
      repairType: self.repairType,
      status: self.status,
      dueDate: self.dueDate,
      sorCode: self.sorCode,
      expectedCompletion: self.expectedCompletion,
      attendedDate: self.attendedDate,
      attendedBy: self.attendedBy,
      outcome: self.outcome,
      cancelledDate: self.cancelledDate,
      tasks: self.tasks,
    }
  end

  private
  def set_reference
    self.workOrderReference = rand(9999999)
    self.supplierReference = "W1"
  end
end
