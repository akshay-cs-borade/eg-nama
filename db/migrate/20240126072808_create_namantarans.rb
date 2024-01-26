class CreateNamantarans < ActiveRecord::Migration[7.0]
  def change
    create_table :namantarans do |t|
      t.string :flat_no
      t.string :mohalla
      t.string :pin_no
      t.string :aawak_no
      t.string :aawak_dinank
      t.string :nama_dinank
      t.string :rujwat_dinank
      t.string :pavati_no
      t.string :nama_rashi
      t.string :rujwat_rashi
      t.string :sthan_par
      t.string :ka_naam
      t.string :tal
      t.string :prathm
      t.string :divitiya
      t.string :tritiya
      t.string :other   

      t.timestamps
    end
  end
end
