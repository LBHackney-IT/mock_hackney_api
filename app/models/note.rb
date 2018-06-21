class Note < ApplicationRecord
  belongs_to :target, polymorphic: true

  def as_json(*)
    {
      user: self.user,
      created: self.created_at,
      text: self.text,
    }
  end
end
