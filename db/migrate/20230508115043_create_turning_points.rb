class CreateTurningPoints < ActiveRecord::Migration[7.0]
  def change
    create_table :turning_points do |t|
      t.string :current_task
      t.string :enthusiastic
      t.string :favorite_word
      t.string :unpleasant_thing
      t.string :what_i_want_to_do_in_the_future

      t.references :user, null: false
      t.timestamps
    end
  end
end
