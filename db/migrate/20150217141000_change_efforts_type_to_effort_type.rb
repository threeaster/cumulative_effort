class ChangeEffortsTypeToEffortType < ActiveRecord::Migration
  def change
    change_table :efforts do |t|
      t.rename :type, :effort_type
    end
  end
end
