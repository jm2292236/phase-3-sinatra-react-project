class CreateServices < ActiveRecord::Migration[6.1]
    def change
        create_table :services do |t|
            t.string :description
        end
    end
end
