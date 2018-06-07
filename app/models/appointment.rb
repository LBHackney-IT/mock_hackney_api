class Appointment < ApplicationRecord
  belongs_to :work_order

  validates :beginDate, presence: true
  validates :endDate, presence: true

  def as_json(*)
    {
      beginDate: self.beginDate,
      endDate: self.endDate,
    }
  end
end
