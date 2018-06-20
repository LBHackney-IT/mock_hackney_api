class Task < ApplicationRecord
  belongs_to :work_order

  def as_json(*)
    {
      sorCode: self.sorCode,
      dueDate: self.dueDate,
      supplierReference: self.supplierReference,
      estimatedCost: self.estimatedCost,
      trade: self.trade,
      completedDate: self.completedDate,
      description: self.description,
    }
  end
end
