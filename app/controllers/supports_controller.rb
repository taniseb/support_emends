class SupportsController < ApplicationController

  def new
    @support = Support.new
  end
  def create
    @support = Support.new
    @support.emmend = @emmend.id
    @support.user_id = current_user
      render :new
    end
  end

end
