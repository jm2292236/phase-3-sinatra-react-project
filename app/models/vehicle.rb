require 'date'

class Vehicle < ActiveRecord::Base

    has_many :vehicle_logs

end
