class CreateQuestionMasters < ActiveRecord::Migration[5.0]
  def change
    create_table :question_masters do |t|
      t.string :type
      t.references :user, foreign_key: true
      t.string :title
      t.string :content
      t.date :deadline

      t.timestamps
    end
  end
end
