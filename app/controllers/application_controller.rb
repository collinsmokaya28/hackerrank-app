class ApplicationController < ActionController::API
  include ActionController::Cookies

  private

    def current_user #keeps track of current user
        User.find_by_id(id: session[:user_id])
    end

    def record_not_found(errors)
        render json: {errors: errors.message}, status: 404
    end

    def record_not_valid(invalid)
        render json: {errors: invalid.record.errors.full_message}, status: :unprocessable_entity
    end


end
