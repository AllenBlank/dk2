class CreateSynergies < ActiveRecord::Migration
  def change
    create_table :synergies do |t|
      t.integer :pile_id
      t.integer :compliment_id

      t.timestamps
    end
    add_index :synergies, :pile_id
    add_index :synergies, :compliment_id
    add_index :synergies, [:pile_id, :compliment_id], unique: true
  end
end
