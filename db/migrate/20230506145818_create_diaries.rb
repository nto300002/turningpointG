class CreateDiaries < ActiveRecord::Migration[7.0]
  def change
    create_table :diaries do |t|
      t.string :title, null: false
      t.string :detail
      t.string :emotion
      t.integer :evaluation

      t.references :user, null: false
      # t.references :search_word

      t.timestamps
    end
  end
end
