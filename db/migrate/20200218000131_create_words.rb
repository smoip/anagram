class CreateWords < ActiveRecord::Migration[6.0]
  def change
    create_table :words do |t|
      t.string :text, null: false, unique: true
      t.integer :text_length, null: false
      t.timestamps
    end
    add_index :words, :text
    add_index :words, :text_length
  end
end
