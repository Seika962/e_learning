class CreateChoices < ActiveRecord::Migration[5.2]
  def change
    create_table :choices do |t|
      t.string :content
      t.boolean :is_correct
      t.integer :word_id

      t.timestamps
    end
  end
end
