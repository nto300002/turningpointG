class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, force: :cascade do |t|
      t.string :name, null: false
      t.string :email
      t.string :password_digest
      t.string :reset_digest
      t.string :remember_digest
      # t.datetime :created_at, null: false
      # t.datetime :updated_at, null: false

      t.timestamps
    end
  end
end
