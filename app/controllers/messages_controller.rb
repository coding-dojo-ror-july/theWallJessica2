class MessagesController < ApplicationController
    def show
        @user = User.find(session[:user_id])
        @messages = Message.all
        render 'show'
    end    
    def create
        message = Message.new(comment:params[:message], user:User.find(session[:user_id])) 
        if message.save
            redirect_to '/messages/show'
        else 
            flash[:errors] = message.errors.full_messages   
            redirect_to '/messages/show' 
        end     
    end
    
    
end
