class SessionsController < ApplicationController
    def new
    end
    
    def create
        user = User.find_by_email(params[:email])
        if user && User.authenticate(params[:email], params[:password])
            session[:user_id] = user.id
            redirect_to home_path, notice: "Logged in!"
        elsif User.from_omniauth(request.env['omniauth.auth'])
            begin
                @user = User.from_omniauth(request.env['omniauth.auth'])
                session[:user_id] = @user.id
                flash[:success] = "Welcome, #{@user.name}!"
            rescue
                flash[:warning] = "There was an error while trying to authenticate you..."
            end
        else
            flash.now.alert = "Email or password is invalid"
            render "new"
        end
    end
    
    def destroy
        session[:user_id] = nil
        redirect_to home_path, notice: "Logged out!"
    end
end