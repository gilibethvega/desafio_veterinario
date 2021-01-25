class PetHistory < ApplicationRecord
  belongs_to :pet

  enum status: [:in_treatment, :healthy]

end
