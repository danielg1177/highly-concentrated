class AddCoordinatesToGanja < ActiveRecord::Migration[6.0]
  def change
    add_column :ganjas, :latitude, :float
    add_column :ganjas, :longitude, :float
  end
end
