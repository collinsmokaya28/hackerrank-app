class ApplicationController < ActionController::API
  include ActionController::Cookies
  before_action :authenticate_user
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :record_not_valid
  

  private

    #defines which action to invoke before executing action logic by using controller filter before_action
    #gives authorization
    def authenticate_user
        return render json: {error: "Not authorized"}, status: :unauthorized unless session.include? :user_id
    end

    def record_not_found(error)
        render json: {errors: error.message}, status: :not_found
    end

    def record_not_valid(invalid)
        render json: {errors: invalid.record.errors.full_message}, status: :unprocessable_entity
    end

    def current_user #keeps track of current user memorzation
        @current_user ||= User.find_by(id: session[:user_id])
    end


end
