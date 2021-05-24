class CreateCorrections < ActiveRecord::Migration[6.0]
  def change
    create_table :corrections do |t|
      t.text :body
      t.boolean :is_accepted, default: False
      t.integer :user_id


      t.timestamps
    end
  end
end
