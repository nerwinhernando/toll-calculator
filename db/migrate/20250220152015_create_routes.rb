class CreateRoutes < ActiveRecord::Migration[8.0]
  def change
    create_table :routes do |t|
      t.references :expressway, null: false, foreign_key: true
      t.references :origin, null: false, foreign_key: { to_table: :cities }
      t.references :destination, null: false, foreign_key: { to_table: :cities }
      t.decimal :toll_fee, precision: 10, scale: 2, null: false
      t.integer :vehicle_class, null: false, default: 1

      t.timestamps
    end

    add_index :routes, [:expressway_id, :origin_id, :destination_id, :vehicle_class],
              unique: true,
              name: 'idx_routes_on_expressway_cities_and_class'
  end
end
