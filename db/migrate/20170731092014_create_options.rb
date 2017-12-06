class CreateOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :options do |t|
      t.string :type
      t.references :question_master, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
