class RenameTypeColumnToQuestionMasters < ActiveRecord::Migration[5.0]
  def change
    rename_column :question_masters, :type, :question_type
  end
end
