class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.integer :user_id
      t.string :format
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
