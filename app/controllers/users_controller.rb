class UsersController < ApplicationController
    def index
        render 'index'
    end
    def create
        user = User.new(user_params)
        if user.save
            session[:user_id] = user.id 
            redirect_to '/messages/show'
        else 
            flash[:errors] = user.errors.full_messages 
            redirect_to '/' 
        end 
    end

    def authenticate 
    user = User.find_by(username: user_params[:username])
    if user.authenticate(user_params[:password])
      session[:user_id] = user.id
      redirect_to '/messages/show'
    else 
        flash[:errors] = user.errors.full_messages  
        redirect_to '/'
    end
    end
    def logout
        reset_session
        redirect_to "/"
    end  
    private
        def user_params
        params.require(:user).permit(:username, :password, :password_confirmation)
        end   

end
