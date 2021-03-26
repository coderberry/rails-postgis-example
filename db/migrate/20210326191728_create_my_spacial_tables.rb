class CreateMySpacialTables < ActiveRecord::Migration[6.1]
  def change
    create_table :my_spacial_tables do |t|
      t.column :shape1, :geometry
      t.geometry :shape2
      t.line_string :path, srid: 3785
      t.st_point :lonlat, geographic: true
      t.st_point :lonlatheight, geographic: true, has_z: true

      t.index :lonlat, using: :gist

      t.timestamps
    end
  end
end
