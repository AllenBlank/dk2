class FixColumnTypo < ActiveRecord::Migration
  def change
    rename_column :searches, :text_filed, :text_field
  end
end
