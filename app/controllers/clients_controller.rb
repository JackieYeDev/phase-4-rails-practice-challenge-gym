class ClientsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_response
    def show
        client = Client.find(params[:id])
        render json: client
    end
    private
    def record_not_found_response
        render json: { error: "Client not found" }, status: :not_found
    end
end
