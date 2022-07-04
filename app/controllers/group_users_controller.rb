class GroupUsersController < ApplicationController
  def create
    current_user.join(params:[:user_id])
    redirect_to request.referer
  end
  
  def destroy
    current_user.leave(params[:user_id])
    redirect_to request.referer
  end
end
