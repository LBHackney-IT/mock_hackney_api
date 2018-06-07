class Repair < ApplicationRecord
  validates :repairRequestReference, presence: true
  validates :propertyReference, presence: true
  validates :problemDescription, presence: true
  validates :priority, presence: true
end
