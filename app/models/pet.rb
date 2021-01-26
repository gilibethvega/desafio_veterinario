class Pet < ApplicationRecord
  has_many :pet_histories, dependent: :destroy
  belongs_to :client
  
  validates :name, presence: true
  validates :breed, presence: true
  validates :date_birthday, presence: true

  
  def to_s
    name
  end

  def client_name
    self.client.name
  end

  def number_visits
    PetHistory.references(:pets).where(pet_id: id).count
  end

  def history_pet
    @history = PetHistory.references(:pets).where(pet_id: id).pluck(:weight, :height)
    n = @history.count
    new_array = []
    n.times do |i|
      new_array.push 'Peso(kg) y altura(cm) en cita N°'
      new_array.push i+1
      new_array.push '='
      n.times do |j|
        new_array.push @history[i][j]
      end
      new_array.push '/'
    end
    final_array = new_array.join(' ')
    final_array
  end
  def average_weight
    @weight = PetHistory.references(:pets).where(pet_id: id).pluck(:weight)
    n = @weight.count
    if n == 0
      "No existen datos"
    else
      ((@weight.map { |w| w }.sum)/n).round(2)
    end
  end
  def average_height
    @height = PetHistory.references(:pets).where(pet_id: id).pluck(:height)
    n = @height.count
    if n == 0
      "No existen datos"
    else
      ((@height.map { |h| h }.sum)/n).round(2)
    end
  end
  def max_weight
    @weight.map { |w| w }.max
  end
  def max_height
    @height.map { |h| h }.max
  end
end

