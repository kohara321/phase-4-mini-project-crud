class SpicesController < ApplicationController
    def index
        spices = Spice.all 
        render json: spices
    end

    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end

    def update
        spice = find_spice
        if spice
            spice.update(spice_params)
            render json: spice
        else
            render_not_found_resource
        end
    end

    def destroy
        spice = find_spice
        spice.destroy
        head :no_content
    end

    private 

    def find_spice
        Spice.find_by(id: params[:id])
    end

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

    def render_not_found_resource
        render json: { error: "Spice not found" }, status: :not_found
    end
end
