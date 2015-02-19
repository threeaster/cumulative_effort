class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.references :effort, index: true
      t.date :date
      t.float :quantity

      t.timestamps
    end
  end
end
