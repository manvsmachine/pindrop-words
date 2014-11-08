class AddWordIndexToEntries < ActiveRecord::Migration
  def change
      change_column :entries, :word, :string, null: false, unique: true 
      add_index :entries, :word, unique: true
  end
end
