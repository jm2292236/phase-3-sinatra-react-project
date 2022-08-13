require 'date'

class CreateVehicleLogs < ActiveRecord::Migration[6.1]
    def change
        create_table :vehicle_logs do |t|
            t.integer :log_type
            t.date :log_date
            t.integer :odometer
            t.float :quantity
            t.float :price_per_gallon
            t.float :total_cost
            t.string :notes
            t.integer :service_id
            t.integer :location_id
            t.integer :vehicle_id
            t.timestamps
        end
    end
end
