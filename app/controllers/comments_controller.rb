#encoding: utf-8
class CommentsController < ApplicationController
	def create
		@pin = Pin.find(params[:pin_id])
		@comment = @pin.comments.new(params[:comment])
    	@comment.user = current_user
		@comment.save
		
	end
	def destroy
		@comment = Comment.find(params[:id])
		@pin = Pin.find(@comment.pin_id)
		@comment.destroy		
	end
end
