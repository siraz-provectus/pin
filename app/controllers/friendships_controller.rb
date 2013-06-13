class FriendshipsController < ApplicationController	
  def create
  	@friendship = current_user.friendships.build(friend_id: params[:friend_id])
    respond_to do |format|
    	if @friendship.save
        format.html { redirect_to(user_url(params[:friend_id]), :notice => 'Added friend.') }  
        format.js 
    	else
        format.html { redirect_to(user_url(params[:friend_id]), :error => 'Unable to add friend.') }  
        format.js 
      end
    end
  end

  def destroy
    @friendship = current_user.friendships.find_by_friend_id(params[:id])
    @friendship.destroy
    respond_to do |format|
      format.html { redirect_to(user_url(params[:id]), :notice => 'Removed friendship.') }  
      format.js 
    end
  end
end
