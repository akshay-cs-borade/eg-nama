class AddFieldRujwatNo < ActiveRecord::Migration[7.0]
  def change
    add_column :namantarans, :rujwat_no, :string
  end
end
