class LikesController < ApplicationController
  before_action :set_object

  def create
    respond_to do |format|
      if @object.increment!(:likes_count,1)
        format.html { redirect_to @object, notice: "#{@object.class.name} was successfully liked." }
      else
        format.html { render :index}
      end
    end
  end

  def destroy
    @object.decrement!(:likes_count,1)
    respond_to do |format|
      format.html { redirect_to @object, notice: '#{@object.class.name} was successfully disliked.' }
      format.json { head :no_content }
    end
  end

  private
    def set_object
      @object = params[:object_type].classify.constantize.find(params[:object_id])
    end
end
