class CreateEfforts < ActiveRecord::Migration
  def change
    create_table :efforts do |t|
      t.integer :user_id
      t.string :name
      t.integer :type
      t.string :unit

      t.timestamps
    end
  end
end
