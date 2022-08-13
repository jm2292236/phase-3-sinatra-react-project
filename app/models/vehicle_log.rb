class VehicleLog < ActiveRecord::Base

    belongs_to :service
    belongs_to :location
    belongs_to :vehicle

end
