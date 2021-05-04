class ChangePickuptimeType < ActiveRecord::Migration[6.0]
  def up
    change_column :purchase_requests, :pickup_time, "date USING pickup_time::timestamp without time zone"
    change_column :purchase_requests, :pickup_time, :datetime
  end

  def down
    change_column :purchase_requests, :pickup_time, :string
  end
end
