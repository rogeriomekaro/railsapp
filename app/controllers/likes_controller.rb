class LikesController < ApplicationController
  before_action :set_object

  def create  
    like = Like.new(user: current_user, object_id: params[:object_id], object_type: params[:object_type])

    respond_to do |format|
      if like.save
        @object.increment!(:likes_count,1) 
        format.js
      else
        format.html { render :index}
      end
    end
  end

  def destroy
    like = Like.where(user_id:current_user.id, object_type:params[:object_type], object_id:params[:object_id])

    if(like.destroy)
      if @object.decrement!(:likes_count,1)
        respond_to do |format|
          format.js
        end
      end
    end
  end

  private
    def set_object
      @object = params[:object_type].classify.constantize.find(params[:object_id])
    end
end
