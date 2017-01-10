class GatepassesController < ApplicationController
  before_action :confirm_logged_in
  before_action :set_gatepass, only: [:show, :edit, :update, :destroy]

  # GET /gatepasses
  # GET /gatepasses.json
  def index
    @gatepasses = Gatepass.all
  end

  # GET /gatepasses/1
  # GET /gatepasses/1.json
  def show
    @gatepass = Gatepass.find(params[:id])

    # Generate PDF
    # https://rubyplus.com/articles/3891-PDFs-with-Prawn-in-Rails-5
    respond_to do |format|
      format.html
      format.json
      format.pdf {render template: 'gatepasses/report', pdf: 'Report', layout: 'pdf.html', paper_size: 'A4', footer: {  right: '[page] of [topage]'}}

      # Prawn PDF Work
      # format.pdf do
      #   pdf = GatepassPdf.new(@gatepass)
      #   send_data pdf.render,
      #       filename: "gatepass_#{@gatepass.id}",
      #       type: 'application/pdf',
      #       disposition: 'inline'
      # end
    end
  end

  # GET /gatepasses/new
  def new
    # Guides for nested form
    # https://www.sitepoint.com/better-nested-attributes-in-rails-with-the-cocoon-gem/
    # https://rubyplus.com/articles/3681-Complex-Forms-in-Rails-5%20'Complex%20Forms%20in%20Rails%205
    @gatepass = Gatepass.new
    # @users = User.all
    @gate_types = GateType.all
    @nationals = National.sorted
    @companies = Company.sorted
    @sections = Section.sorted

  end

  # GET /gatepasses/1/edit
  def edit
    @users = User.all
    @gate_types = GateType.all
    @nationals = National.sorted
    @companies = Company.sorted
    @sections = Section.sorted
  end

  # POST /gatepasses
  # POST /gatepasses.json
  def create
    @gatepass = Gatepass.new(gatepass_params)
    @gatepass.user_id = session[:user_id]

    respond_to do |format|
      if @gatepass.save
        format.html { redirect_to @gatepass, notice: 'Gatepass was successfully created.' }
        format.json { render :show, status: :created, location: @gatepass }
      else
        # @users = User.all
        @gate_types = GateType.all
        @nationals = National.sorted
        @companies = Company.sorted
        @sections = Section.sorted

        format.html { render :new }
        format.json { render json: @gatepass.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gatepasses/1
  # PATCH/PUT /gatepasses/1.json
  def update
    respond_to do |format|
      @gatepass.user_id = session[:user_id]
      if @gatepass.update_attributes(gatepass_params)
        format.html { redirect_to @gatepass, notice: 'Gatepass was successfully updated.' }
        format.json { render :show, status: :ok, location: @gatepass }
      else
        # @users = User.all
        @gate_types = GateType.all
        @nationals = National.sorted
        @companies = Company.sorted
        @sections = Section.sorted
        format.html { render :edit }
        format.json { render json: @gatepass.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gatepasses/1
  # DELETE /gatepasses/1.json
  def destroy
    @gatepass.destroy
    respond_to do |format|
      format.html { redirect_to gatepasses_url, notice: 'Gatepass was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gatepass
      @gatepass = Gatepass.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gatepass_params
      params.require(:gatepass).permit(:user_id, :gate_type_id, :national_id, :company_id, :section_id, :from_date, :to_date, :reason, :person, :car_no, :car_type, :car_color, :ref_no, :note, items_attributes: [:id, :name, :qty, :_destroy])
    end
end
