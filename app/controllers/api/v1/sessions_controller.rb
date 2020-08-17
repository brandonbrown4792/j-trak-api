class Api::V1::SessionsController < ApplicationController

    def create
        user = User.find_by(username: session_params[:username_email]) || 
            User.find_by(email: session_params[:username_email])
        
        if user
            if user.authenticate(session_params[:password])
                token = JWT.encode({ user_id: user.id }, ENV['SUPER_SECRET_KEY'])
                render :json => { token: token, username: user.username }, :status => :ok
            else
                render :json => { message: 'Password is incorrect' }, :status => :unauthorized
            end
        else
            render :json => { message: 'That email or username does not exist' }, :status => :not_found
        end
    end

    private

    def session_params
        params.require(:user).permit(:username_email, :password)
    end
    
end
