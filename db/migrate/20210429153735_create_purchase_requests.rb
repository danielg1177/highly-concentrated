class CreatePurchaseRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_requests do |t|
      t.references :user, null: false, foreign_key: true
      t.references :ganja, null: false, foreign_key: true
      t.string :status
      t.string :pickup_time

      t.timestamps
    end
  end
end
