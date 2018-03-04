class ChangeDepartmentIdToIntegerInDepartmentMasters < ActiveRecord::Migration
  def change
    change_column :program_masters, :department_id, 'integer USING CAST(department_id AS integer)'
  end
end
