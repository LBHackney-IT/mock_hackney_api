class Block < Property
  belongs_to :estate, foreign_key: 'parentReference', primary_key: 'propertyReference'

  def as_json(*)
    super.merge({
      managerName: self.managerName,
      managerEmail: self.managerEmail,
      managerPhone: self.managerPhone,
      floors: self.floors,
      entranceDoors: self.entranceDoors,
      lifts: self.lifts,
      heating: self.heating,
    })
  end
end
