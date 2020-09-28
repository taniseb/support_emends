class EmmendsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]

  before_action :set_emmend, only: [:show, :edit, :update, :destroy]

  # GET /emmends
  def index
    if params[:query].present?
      @emmends = Emmend.search_by_name_and_description_and_project_and_thema(params[:query])
    else
      @emmends = Emmend.all
    end

      @emmends = @emmends.order("updated_at DESC")

  end

  # GET /emmends/1
  def show
    @support = Support.new
    @emmend = Emmend.find(params[:id])
    @current_user = current_user
    @user_is_supporter = @emmend.supports.any? do |support|
      support.supporter == current_user
    end
  end

  # GET /emmends/new
  def new
    @emmend = Emmend.new
  end

  # GET /emmends/1/edit
  def edit
  end

  # POST /emmends
  def create
    @emmend = Emmend.new(emmend_params)
    @emmend.user = current_user

    if @emmend.save
      redirect_to @emmend, notice: 'Emmend was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /emmends/1
  def update
    if @emmend.update(emmend_params)
      redirect_to @emmend, notice: 'Emmend was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /emmends/1
  def destroy

    if @emmend.user != current_user
      redirect_to root_path, alert: 'Not authorized'
      return
    end

    @emmend.destroy
    redirect_to emmends_url, notice: 'Emmend was successfully deleted.'
  end
  def home
    @supports = Support.all
    @user_is_supporter = @supports.select do |support|
      support.supporter == current_user
    end
    @emmends = Emmend.all
    @user_created = @emmends.select do |emmend|
      emmend.user == current_user
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_emmend
      @emmend = Emmend.find(params[:id])
    end

    # Only allow a trusted parameter "white-list" through.
    def emmend_params
      params.require(:emmend).permit(:project, :thema, :name, :description)
    end

end
