class VehiclesController < Sinatra::Base

    # Vehicles end points
    # ===================
    get "/vehicles" do
        Vehicle.all.to_json
    end

    post "/vehicles" do
        vehicle = Vehicle.create(
            make: params[:make],
            model: params[:model],
            year: params[:year],
            license_plate: params[:license_plate],
            registration_due_month: params[:registration_due_month]
        )

        vehicle.to_json
    end

    patch "/vehicles/:id" do
        vehicle = Vehicle.find(params[:id])
        vehicle.update(
            make: params[:make],
            model: params[:model],
            year: params[:year],
            license_plate: params[:license_plate],
            registration_due_month: params[:registration_due_month]
        )

        vehicle.to_json
    end

    delete "/vehicles/:id" do
        vehicle = Vehicle.find(params[:id])
        vehicle.destroy

        vehicle.to_json
    end
    
end
