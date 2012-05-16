class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :name
      t.references :topic

      t.timestamps
    end
    add_index :questions, :topic_id
  end
end
