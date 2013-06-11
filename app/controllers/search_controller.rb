#encoding: utf-8
class SearchController < ApplicationController
  def search
    @pins = Pin.where("title like ?", "%#{params[:query]}%")
    render 'home/index'
  end
end
