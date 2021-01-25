class CreatePetHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :pet_histories do |t|
      t.float :weight
      t.float :height
      t.integer :status
      t.string :diagnosis

      t.timestamps
    end
  end
end
