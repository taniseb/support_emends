class SupportsController < ApplicationController

  #def new
   # @support = Support.new
  #end
  def create
    @support = Support.new
    @support.emmend = Emmend.find(params[:emmend_id])
    @support.user_id = current_user.id
    @support.save
    redirect_to emmend_path(@support.emmend), notice: "Emenda Apoiada com Sucesso"
  end
  def destroy
    @support.destroy
  end
end
