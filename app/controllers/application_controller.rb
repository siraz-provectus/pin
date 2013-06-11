#encoding: utf-8
class ApplicationController < ActionController::Base
  before_filter :best_user
  #before_filter :authenticate_user!
  protect_from_forgery

  private
  	def best_user
  		 @best_users =User.all.sort! { |a,b| b.pins.count <=> a.pins.count }
  	end
end
