class GateTypesController < ApplicationController
  before_action :confirm_logged_in
  before_action :set_gate_type, only: [:show, :edit, :update, :destroy]

  # GET /gate_types
  # GET /gate_types.json
  def index
    @gate_types = GateType.all
  end

  # GET /gate_types/1
  # GET /gate_types/1.json
  def show
  end

  # GET /gate_types/new
  def new
    @gate_type = GateType.new
  end

  # GET /gate_types/1/edit
  def edit
  end

  # POST /gate_types
  # POST /gate_types.json
  def create
    @gate_type = GateType.new(gate_type_params)

    respond_to do |format|
      if @gate_type.save
        format.html { redirect_to @gate_type, notice: 'Gate type was successfully created.' }
        format.json { render :show, status: :created, location: @gate_type }
      else
        format.html { render :new }
        format.json { render json: @gate_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gate_types/1
  # PATCH/PUT /gate_types/1.json
  def update
    respond_to do |format|
      if @gate_type.update(gate_type_params)
        format.html { redirect_to @gate_type, notice: 'Gate type was successfully updated.' }
        format.json { render :show, status: :ok, location: @gate_type }
      else
        format.html { render :edit }
        format.json { render json: @gate_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gate_types/1
  # DELETE /gate_types/1.json
  def destroy
    @gate_type.destroy
    respond_to do |format|
      format.html { redirect_to gate_types_url, notice: 'Gate type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gate_type
      @gate_type = GateType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gate_type_params
      params.require(:gate_type).permit(:name)
    end
end
