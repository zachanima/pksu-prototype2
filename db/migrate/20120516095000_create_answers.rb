class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :name
      t.boolean :is_correct
      t.references :question

      t.timestamps
    end
    add_index :answers, :question_id
  end
end
