class AddMilesDrivenToVehicleLogs < ActiveRecord::Migration[6.1]
    def change
        add_column :vehicle_logs, :miles_driven, :float
    end
end
