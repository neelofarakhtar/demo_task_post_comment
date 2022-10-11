class RelationshipsController < ApplicationController
 def follow_user
    @user = User.find(current_user.id)
    if current_user.follow @user.id
      respond_to do |format|
        format.html { redirect_to users_url }
        format.js
      end
    end
  end

  def unfollow_user
    @user = User.find(current_user.id)
    if current_user.unfollow @user.id
      respond_to do |format|
        format.html { redirect_to users_url }
        format.js
      end
    end
  end
end
