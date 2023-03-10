class ApartmentsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def index
        apartments = Apartment.all 
        render json: apartments
    end

    def show
        apartment = Apartment.find(find_apartment)
        render json: apartment
    end

    def update
        apartment = Apartment.find(find_apartment)
        apartment.update(apartment_params)
        render json: apartment, status: :accepted
    end

    def create
        apartment = Apartment.create!(apartment_params)
        render json: apartment, status: :created
    end

    def destroy
        apartment = Apartment.find(find_apartment)
        apartment.destroy
        head :no_content
    end

    private

    def find_apartment
        params[:id]
    end

    def apartment_params
        params.permit(:number)
    end

    def render_not_found_response
        render json: { error: "Apartment not found" }, status: :not_found
    end

    def render_unprocessable_entity_response(exception)
        render json: { error: exception.record.errors.full_messages }, status: :unprocessable_entity
    end
end
