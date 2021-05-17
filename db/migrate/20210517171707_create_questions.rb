class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :head
      t.text :body

      t.timestamps
    end
  end
end
