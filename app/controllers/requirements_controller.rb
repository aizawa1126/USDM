class RequirementsController < ApplicationController
  before_action :set_requirement, only: [:show, :edit, :update, :destroy]
  before_action :set_chapter, only: [:create, :update]

  # GET /requirements
  # GET /requirements.json
  def index
    @requirements = Requirement.all
  end

  # GET /requirements/new
  def new
    @requirement = Requirement.new
    @section = Section.find(params[:section_id])
  end

  # GET /requirements/1/edit
  def edit
    @section = Section.find(@requirement.section_id)
    @chapter = Chapter.find(@section.chapter_id)
  end

  # POST /requirements
  # POST /requirements.json
  def create
    @requirement = Requirement.new(requirement_params)

    respond_to do |format|
      if @requirement.save
        format.html { redirect_to chapter_path(@chapter.id), notice: 'Requirement was successfully created.' }
        format.json { render :show, status: :created, location: @requirement }
      else
        format.html { render :new }
        format.json { render json: @requirement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requirements/1
  # PATCH/PUT /requirements/1.json
  def update
    respond_to do |format|
      if @requirement.update(requirement_params)
        format.html { redirect_to chapter_path(@chapter), notice: 'Requirement was successfully updated.' }
        format.json { render :show, status: :ok, location: @requirement }
      else
        format.html { render :edit }
        format.json { render json: @requirement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requirements/1
  # DELETE /requirements/1.json
  def destroy
    @section = Section.find(@requirement.section_id)
    @chapter = Chapter.find(@section.chapter_id)
    @requirement.destroy
    respond_to do |format|
      format.html { redirect_to chapter_path(@chapter), notice: 'Section was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_requirement
      @requirement = Requirement.find(params[:id])
    end

    def set_chapter
      @section = Section.find(params[:requirement][:section_id])
      @chapter = Chapter.find(@section.chapter_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def requirement_params
      params.require(:requirement).permit(:number, :content, :reason, :description, :section_id)
    end
end
