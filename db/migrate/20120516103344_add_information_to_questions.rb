class AddInformationToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :information, :text
  end
end
