class ApplicationController < ActionController::API
rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private

  def record_not_found
    render json: {errors: "Record Doesn't Exists"}, status: :not_found
  end
end
