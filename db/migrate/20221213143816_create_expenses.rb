class CreateExpenses < ActiveRecord::Migration[7.0] # :nodoc:
  def change
    create_table :expenses do |t|
      t.string :name
      t.integer :amount
      t.references :user, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
