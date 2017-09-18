class FunctionsController < ApplicationController
  before_action :set_function, only: [:show, :edit, :update, :destroy]
  before_action :set_chapter, only: [:create, :update]

  # GET /functions
  # GET /functions.json
  def index
    @functions = Function.all
  end

  # GET /functions/new
  def new
    @function = Function.new
    @requirement = Requirement.find(params[:requirement_id])
    @section = Section.find(@requirement.section_id)
    @chapter = Chapter.find(@section.chapter_id)
  end

  # GET /functions/1/edit
  def edit
    @requirement = Requirement.find(@function.requirement_id)
    @section = Section.find(@requirement.section_id)
    @chapter = Chapter.find(@section.chapter_id)
  end

  # POST /functions
  # POST /functions.json
  def create
    @function = Function.new(function_params)

    respond_to do |format|
      if @function.save
        format.html { redirect_to chapter_path(@chapter.id), notice: 'Requirement was successfully created.' }
        format.json { render :show, status: :created, location: @function }
      else
        format.html { render :new }
        format.json { render json: @function.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /functions/1
  # PATCH/PUT /functions/1.json
  def update
    respond_to do |format|
      if @function.update(function_params)
        format.html { redirect_to chapter_path(@chapter), notice: 'Requirement was successfully updated.' }
        format.json { render :show, status: :ok, location: @function }
      else
        format.html { render :edit }
        format.json { render json: @function.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /functions/1
  # DELETE /functions/1.json
  def destroy
    @requirement = Requirement.find(@function.requirement_id)
    @section = Section.find(@requirement.section_id)
    @chapter = Chapter.find(@section.chapter_id)
    @function.destroy
    respond_to do |format|
      format.html { redirect_to chapter_path(@chapter), notice: 'Function was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_function
      @function = Function.find(params[:id])
    end

    def set_chapter
      @requirement = Requirement.find(params[:function][:requirement_id])
      @section = Section.find(@requirement.section_id)
      @chapter = Chapter.find(@section.chapter_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def function_params
      params.require(:function).permit(:name, :requirement_id)
    end
end
