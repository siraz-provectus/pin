#encoding: utf-8
class CommentsController < ApplicationController

  before_filter :authenticate_user!

	def create
		@comment = current_user.comments.create!(
      params[:comment].merge({ pin_id: params[:pin_id] } )
		)
	end

	def destroy
		@comment = current_user.comments.find(params[:id])
		@comment.destroy		

		render nothing: true
	end
end
