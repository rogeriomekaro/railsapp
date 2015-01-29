class LikesController < ApplicationController
  before_action :set_object

  def create
    respond_to do |format|
      if @object.increment!(:likes_count,1)
        format.html { redirect_to @object, notice: "#{@object.class.name} was successfully updated." }
      else
        format.html { render :index}
      end
    end
  end

  def destroy
    @object.destroy
    respond_to do |format|
      format.html { redirect_to ideas_url, notice: '#{@object.class.name} was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_object
      @object = params[:object_type].classify.constantize.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def idea_params
      params.require(:idea).permit(:name, :description, :picture)
    end
end
