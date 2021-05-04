class CreateChats < ActiveRecord::Migration[6.0]
  def change
    create_table :chats do |t|
      t.string :content
      t.references :receiver, foreign_key: { to_table: 'users' }
      t.references :sender, foreign_key: { to_table: 'users' }
      t.timestamps
    end
  end
end
