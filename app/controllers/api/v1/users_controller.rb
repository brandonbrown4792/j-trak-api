class Api::V1::UsersController < ApplicationController

    def create
        user = User.new(user_params)
        if user_params[:password] != user_params[:password_confirmation]
            render :json => { message: 'Passwords must match' }
        else
            if user.save
                token = JWT.encode({ user_id: user.id }, ENV['SUPER_SECRET_KEY'])
                render :json => { token: token, username: user.username }, :status => :ok
            else
                render :json => { message: user.erors.full_messages.join(', ') }, :status => :bad_request
            end
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
    
end
