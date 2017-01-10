class NationalsController < ApplicationController
  before_action :confirm_logged_in
  before_action :set_national, only: [:show, :edit, :update, :destroy]

  # GET /nationals
  # GET /nationals.json
  def index
    @nationals = National.all
  end

  # GET /nationals/1
  # GET /nationals/1.json
  def show
  end

  # GET /nationals/new
  def new
    @national = National.new
  end

  # GET /nationals/1/edit
  def edit
  end

  # POST /nationals
  # POST /nationals.json
  def create
    @national = National.new(national_params)

    respond_to do |format|
      if @national.save
        format.html { redirect_to @national, notice: 'National was successfully created.' }
        format.json { render :show, status: :created, location: @national }
      else
        format.html { render :new }
        format.json { render json: @national.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nationals/1
  # PATCH/PUT /nationals/1.json
  def update
    respond_to do |format|
      if @national.update(national_params)
        format.html { redirect_to @national, notice: 'National was successfully updated.' }
        format.json { render :show, status: :ok, location: @national }
      else
        format.html { render :edit }
        format.json { render json: @national.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nationals/1
  # DELETE /nationals/1.json
  def destroy
    @national.destroy
    respond_to do |format|
      format.html { redirect_to nationals_url, notice: 'National was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_national
      @national = National.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def national_params
      params.require(:national).permit(:name)
    end
end
