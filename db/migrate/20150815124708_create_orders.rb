class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :status, default: "unpaid"
      t.integer :tips
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end
