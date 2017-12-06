class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.string :type
      t.references :question_master, foreign_key: true
      t.references :user, foreign_key: true
      t.string :answer

      t.timestamps
    end
  end
end
