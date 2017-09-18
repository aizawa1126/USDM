class SpecsController < ApplicationController
  before_action :set_spec, only: [:show, :edit, :update, :destroy]
  before_action :set_chapter, only: [:create, :update]

  # GET /specs
  # GET /specs.json
  def index
    @specs = Spec.all
  end

  # GET /specs/new
  def new
    @spec = Spec.new
    @function = Function.find(params[:function_id])
  end

  # GET /specs/1/edit
  def edit
    @function = Function.find(@spec.function_id)
  end

  # POST /specs
  # POST /specs.json
  def create
    @spec = Spec.new(spec_params)

    respond_to do |format|
      if @spec.save
        format.html { redirect_to chapter_path(@chapter.id), notice: 'Requirement was successfully created.' }
        format.json { render :show, status: :created, location: @spec }
      else
        format.html { render :new }
        format.json { render json: @spec.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /specs/1
  # PATCH/PUT /specs/1.json
  def update
    respond_to do |format|
      if @spec.update(spec_params)
        format.html { redirect_to chapter_path(@chapter), notice: 'Section was successfully created.' }
        format.json { render :show, status: :ok, location: @spec }
      else
        format.html { render :edit }
        format.json { render json: @spec.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /specs/1
  # DELETE /specs/1.json
  def destroy
    @function = Function.find(@spec.function_id)
    @requirement = Requirement.find(@function.requirement_id)
    @section = Section.find(@requirement.section_id)
    @chapter = Chapter.find(@section.chapter_id)
    @spec.destroy
    respond_to do |format|
      format.html { redirect_to chapter_path(@chapter), notice: 'Spec was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spec
      @spec = Spec.find(params[:id])
    end

    def set_chapter
      @function = Function.find(params[:spec][:function_id])
      @requirement = Requirement.find(@function.requirement_id)
      @section = Section.find(@requirement.section_id)
      @chapter = Chapter.find(@section.chapter_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def spec_params
      params.require(:spec).permit(:number, :content, :function_id, :customer_review, :design_review, :test_review)
    end
end
