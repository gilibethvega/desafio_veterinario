class PetHistory < ApplicationRecord
  belongs_to :pet
  validates :weight, presence: true
  validates :height, presence: true
  validates :status, presence: true
  validates :diagnosis, presence: true

  enum status: [:in_treatment, :healthy]
  def get_pet_name
    self.pet.name
  end
end
