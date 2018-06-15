class Estate < Property
  def as_json(*)
    super.merge({
      managerName: self.managerName,
      managerEmail: self.managerEmail,
      managerPhone: self.managerPhone,
    })
  end
end
