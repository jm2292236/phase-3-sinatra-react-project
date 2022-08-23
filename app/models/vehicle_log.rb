class VehicleLog < ActiveRecord::Base

    belongs_to :service
    belongs_to :location
    belongs_to :vehicle

    def self.last_log(vehicle_id, log_date)
        last_log = VehicleLog.all
            .where("vehicle_id = ? and log_date <= ?", 
                vehicle_id, log_date)
            .last
        binding.pry
        if last_log == nil
            last_odometer = 0
        else
            last_odometer = last_log.odometer
        end
    end

    def self.log_with_relationships(vehicle_id)
        log = VehicleLog.all.where("vehicle_id = ?", vehicle_id)
        binding.pry

        new_log = log.map("record")
        new_log.to_json
    end

end
