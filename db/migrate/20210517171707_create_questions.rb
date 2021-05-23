class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.integer :user_id, null: false
      t.string :head
      t.text :body

      t.timestamps
    end
  end
end
