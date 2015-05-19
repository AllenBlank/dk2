class CreateTagRelations < ActiveRecord::Migration
  def change
    create_table :tag_relations do |t|
      t.integer :tag_id
      t.integer :pile_id
      t.integer :deck_id
      t.integer :synergy_id

      t.timestamps
    end
    add_index :tag_relations, :tag_id
    add_index :tag_relations, :pile_id
    add_index :tag_relations, :deck_id
    add_index :tag_relations, :synergy_id
  end
end
