class VehicleLog < ActiveRecord::Base

    belongs_to :service
    belongs_to :location
    belongs_to :vehicle

    def self.log_with_relationships(vehicle_id)
        VehicleLog.all.where("vehicle_id = ?", vehicle_id).to_json
    end

end
