class CreateExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses do |t|
      t.string :description
      t.datetime :date
      t.decimal :value
      t.string :status
      t.string :picture
      t.integer :user_id

      t.timestamps
    end
  end
end
