class ServicesController < Sinatra::Base

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

end
