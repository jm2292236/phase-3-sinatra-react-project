class ApplicationController < Sinatra::Base
    set :default_content_type, 'application/json'

    # Log type for fill-ups
    FILL_UP = 1

    # Vehicle_Logs end points
    # =======================
    get '/' do
        'Vehicle Log App Home'
    end

    # Get all the log for a specific vehicle
    get '/vehicle_logs/:id' do
        VehicleLog.all.where("vehicle_id = ?", params[:id]).to_json
    end

    # Get the total cost by type of expense
    # Returns a hash with up to 3 key/value pairs one for each
    # log type: 1=Fill-up, 2=Service, 3=Expense
    get '/vehicle_logs/total_cost/:id' do
        VehicleLog.all
            .where("vehicle_id = ?", params[:id])
            .group(:log_type)
            .sum(:total_cost)
            .to_json
    end

    get '/vehicle_logs/average_mpg/:id' do
        VehicleLog.all
            .where("vehicle_id = ? AND log_type = ?", params[:id], FILL_UP)
            .average("miles_driven / quantity")
            .to_json
    end

    post '/vehicle_logs' do
        # Look for the last log for this car 
        # to determine the miles driven between logs
        last_log = VehicleLog.all
            .where("vehicle_id = ? and log_date <= ?", 
                params[:vehicle_id], params[:log_date])
            .last
        if last_log == nil
            last_odometer = 0
        else
            last_odometer = last_log.odometer
        end

        vehicle_log = VehicleLog.create(
            log_type: params[:log_type],
            log_date: params[:log_date],
            odometer: params[:odometer],
            miles_driven: params[:odometer] - last_odometer,
            quantity: params[:quantity],
            price_per_gallon: params[:price_per_gallon],
            total_cost: params[:total_cost],
            notes: params[:notes],
            service_id: params[:service_id],
            location_id: params[:location_id],
            vehicle_id: params[:vehicle_id]
        )

        vehicle_log.to_json
    end

    patch '/vehicle_logs/:id' do
        vehicle_log = VehicleLog.find(params[:id])
        vehicle_log.update(
            log_type: params[:log_type],
            log_date: params[:log_date],
            odometer: params[:odometer],
            quantity: params[:quantity],
            price_per_gallon: params[:price_per_gallon],
            total_cost: params[:total_cost],
            notes: params[:notes],
            service_id: params[:service_id],
            location_id: params[:location_id],
            vehicle_id: params[:vehicle_id]
        )

        vehicle_log.to_json
    end

    delete '/vehicle_logs/:id' do
        vehicle_log = VehicleLog.find(params[:id])
        vehicle_log.destroy

        vehicle_log.to_json
    end

end
