class LikesController < ApplicationController
  before_action :set_object, only: [:create]
  before_action :set_comment

  def create  
    @like = Like.create!(user: current_user, obj_id: params[:obj_id], obj_type: params[:obj_type].titleize)
    choose_object
    respond_to do |format|
      if @object.increment!(:likes_count,1) 
        set_render format
      else
        format.html { render :index}
      end
    end
  end

  def destroy
    @like = Like.where(id:params[:id], user_id:current_user.id).first
    choose_object

    respond_to do |format|
      if @like.obj_type.classify.constantize.find(@like.obj_id).decrement!(:likes_count, 1)
        @like.destroy
        set_render format
      end
    end
  end

  private
    def set_render format
        if @like.obj_type == "Idea"
          format.js{ render file: "likes/idea.js.haml"}
        elsif @like.obj_type == "Comment"
          format.js{ render  :file => "likes/comment.js.haml" }
        end
    end

    def choose_object
      if @like.obj_type == "Idea"
        @idea = Idea.find(@like.obj_id)
      else
        @comment = Comment.find(@like.obj_id)
      end
    end

    def set_comment
      @comment = Comment.new
    end

    def set_object
      @object = params[:obj_type].classify.constantize.find(params[:obj_id])
    end
end
