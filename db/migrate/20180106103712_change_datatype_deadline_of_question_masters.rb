class ChangeDatatypeDeadlineOfQuestionMasters < ActiveRecord::Migration[5.0]
  def change
    change_column :question_masters, :deadline, :datetime
  end
end
