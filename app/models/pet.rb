class Pet < ApplicationRecord
  has_many :pet_histories, dependent: :destroy

  def to_s
    name
  end

  def number_visits
    PetHistory.references(:pets).where(pet_id: id).count
  end

  def history_pet
    @history = PetHistory.references(:pets).where(pet_id: id).pluck(:weight, :height)
    n = @history.count
    new_array = []
    array = ['Peso y altura en cita N°']
    n.times do |i|
      n_text = [i+1]
      new_array.push array[0]
      new_array.push [i+1]
      new_array.push ['=']
      n.times do |j|
        new_array.push @history[i][j]
      end
      new_array.push '/'
    end
    final_array = new_array.join(' ')
    final_array
  end
  
end

