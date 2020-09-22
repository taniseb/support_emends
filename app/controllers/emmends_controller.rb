class EmmendsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @emmends = Emmend.all
  end

  def new
    @emmend = Emmend.new
  end

  def create
    @emmends = Emmend.new
  end

end
