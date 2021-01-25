class Pet < ApplicationRecord
  has_many :pet_histories, dependent: :destroy

  def to_s
    name
  end
end
