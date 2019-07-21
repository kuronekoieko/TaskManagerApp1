class AddIdsToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks , :pic_id , :int
    add_column :tasks , :status_id , :int
    add_column :tasks , :priority_id , :int
    add_column :tasks , :classification_id , :int
  end
end
