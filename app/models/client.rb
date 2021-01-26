class Client < ApplicationRecord
  has_many :pets, dependent: :destroy

  validates :name, presence: true
  validates :mail, presence: true
  validates :telephone, presence: true

  def to_s
    name
  end

  def pet_name
    self.pet.name
  end
  def pets_number
    Pet.references(:clients).where(client_id: id).count
  end

end
