class ApplicationController < Sinatra::Base
    set :default_content_type, 'application/json'

    # Log type for fill-ups
    FILL_UP = 1

    # Vehicle_Logs end points
    # =======================
    get '/' do
        'Vehicle Log App Home'
    end

    # Get all the logs for a specific vehicle
    get '/vehicle_logs/:id' do
        VehicleLog.all.where("vehicle_id = ?", params[:id]).order(log_date: :desc).to_json
        # VehicleLog.log_with_relationships params[:id]
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

    # get the average MPG for a specific vehicle
    get '/vehicle_logs/average_mpg/:id' do
        VehicleLog.all
            .where("vehicle_id = ? AND log_type = ?", params[:id], FILL_UP)
            .average("miles_driven / quantity")
            .to_json
    end

    # get the totals for a specific vehicle
    get '/vehicle_logs/totals/:id' do
        total_cost = VehicleLog.all
            .where("vehicle_id = ?", params[:id])
            .group(:log_type)
            .sum(:total_cost)

        average_mpg = VehicleLog.all
            .where("vehicle_id = ? AND log_type = ?", params[:id], FILL_UP)
            .average("miles_driven / quantity")
    
        totals = {cost: total_cost, mpg: average_mpg}
        totals.to_json
    end

    # add a log for a vehicle
    post '/vehicle_logs' do
        # Look for the last log for this vehicle
        # to determine the miles driven between logs
        last_odometer = VehicleLog.last_log(
            params[:vehicle_id], params[:log_date]
        )

        binding.pry
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
