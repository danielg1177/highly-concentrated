class ChangeTypeColumnNameToVariety < ActiveRecord::Migration[6.0]
  def change
    rename_column :ganjas, :type, :variety
  end
end
