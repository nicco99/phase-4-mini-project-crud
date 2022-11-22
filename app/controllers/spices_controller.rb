class SpicesController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :method_for_error_handling
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
spice.update(spice_params)
render json: spice, status: :ok
end

def destroy
    spice = find_spice
    spice.destroy
    render json: spice, status: :no_content
end

private
def spice_params
params.permit(:title, :description, :image, :notes, :rating)
end

def find_spice
    Spice.find(params[:id])
end

def method_for_error_handling
    render json: { error: "Bird not found" }, status: :not_found
end

end
