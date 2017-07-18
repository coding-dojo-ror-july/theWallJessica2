class CommentsController < ApplicationController
    def create
        comment = Comment.new(comment:params[:comment], user:User.find(session[:user_id]), message:Message.find(params[:id]))
        if comment.save
            redirect_to '/messages/show'
        else 
            flash[:errors] = comment.errors.full_messages  
            redirect_to '/messages/show'
        end  
    end          
end
