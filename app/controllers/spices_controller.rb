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
    spice = Spice.find(params[:id])
spice.update(spice_params)
render json: spice, status: :ok
end

def destroy
    spice = Spice.find(params[:id])
    spice.destroy
    render json: spice, status: :no_content
end

private
def spice_params
params.permit(:title, :description, :image, :notes, :rating)
end

end
