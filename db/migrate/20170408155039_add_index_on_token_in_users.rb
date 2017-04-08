class AddIndexOnTokenInUsers < ActiveRecord::Migration[5.0]
  def change
    add_index :users, :token
  end
end
