class ApplicationController < Sinatra::Base
    set :default_content_type, 'application/json'
    
    # Services end points
    # ===================
    get "/services" do
        Service.all.to_json
    end

    post "/services" do
        service = Service.create(
            description: params[:description]
        )

        service.to_json
    end

    patch "/services/:id" do
        service = Service.find(params[:id])
        service.update(description: params[:description])

        service.to_json
    end

    delete "/services/:id" do
        service = Service.find(params[:id])
        service.destroy

        service.to_json
    end

    # Locations end points
    # ====================
    get "/locations" do
        Location.all.to_json
    end

    post "/locations" do
        location = Location.create(
            name: params[:name]
        )

        location.to_json
    end

    patch "/locations/:id" do
        location = Location.find(params[:id])
        location.update(name: params[:name])

        location.to_json
    end

    delete "/locations/:id" do
        location = Location.find(params[:id])
        location.destroy

        location.to_json
    end

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
