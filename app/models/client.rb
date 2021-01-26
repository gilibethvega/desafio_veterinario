class Client < ApplicationRecord
  has_many :pets, dependent: :destroy

  validates :name, presence: true
  validates :mail, presence: true
  validates :telephone, presence: true

  def pet_name
    self.pet.name
  end
end
