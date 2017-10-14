class SpecificationsController < ApplicationController
  before_action :set_specification, only: [:show, :edit, :update, :destroy]
  before_action :has_read_operation, only: [:show]

  # GET /specifications
  # GET /specifications.json
  def index
    @specifications = Specification.all
  end

  # GET /specifications/1
  # GET /specifications/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "specs",
             encoding: "UTF-8",
             layout: "pdf.html.erb"
      end
    end
  end

  # GET /specifications/new
  def new
    @specification = Specification.new
  end

  # GET /specifications/1/edit
  def edit
  end

  # POST /specifications
  # POST /specifications.json
  def create
    @specification = Specification.new(specification_params)

    respond_to do |format|
      if @specification.save
        format.html { redirect_to @specification, notice: 'Specification was successfully created.' }
        format.json { render :show, status: :created, location: @specification }
      else
        format.html { render :new }
        format.json { render json: @specification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /specifications/1
  # PATCH/PUT /specifications/1.json
  def update
    respond_to do |format|
      if @specification.update(specification_params)
        format.html { redirect_to @specification, notice: 'Specification was successfully updated.' }
        format.json { render :show, status: :ok, location: @specification }
      else
        format.html { render :edit }
        format.json { render json: @specification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /specifications/1
  # DELETE /specifications/1.json
  def destroy
    @specification.destroy
    respond_to do |format|
      format.html { redirect_to specifications_url, notice: 'Specification was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_specification
      @specification = Specification.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def specification_params
      params.require(:specification).permit(:title, :version)
    end
end
