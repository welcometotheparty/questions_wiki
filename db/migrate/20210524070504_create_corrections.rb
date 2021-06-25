class CreateCorrections < ActiveRecord::Migration[6.0]
  def change
    create_table :corrections do |t|
      t.text :body
      t.boolean :is_accepted, default: false
      t.integer :user_id
      t.integer :question_id
      t.integer :answer_id


      t.timestamps
    end
  end
end
