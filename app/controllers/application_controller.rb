#encoding: utf-8
class ApplicationController < ActionController::Base
 
  protect_from_forgery

  before_filter :get_best_user

  private
  	def get_best_user
  		 @best_users =User.all.sort! { |a,b| b.pins.count <=> a.pins.count }
  	end
end
