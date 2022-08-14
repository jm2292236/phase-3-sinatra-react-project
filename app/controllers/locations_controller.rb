class LocationsController < Sinatra::Base

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

end
