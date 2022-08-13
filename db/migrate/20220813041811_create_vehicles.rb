class CreateVehicles < ActiveRecord::Migration[6.1]
    def change
        create_table :vehicles do |t|
            t.string :make
            t.string :model
            t.integer :year
            t.string :license_plate
            t.integer :registration_due_month # 1=January
        end
    end
end
