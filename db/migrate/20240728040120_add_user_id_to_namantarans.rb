class AddUserIdToNamantarans < ActiveRecord::Migration[7.0]
  def change
    add_column :namantarans, :user_id, :integer
  end
end
