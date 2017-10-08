class RequirementsController < ApplicationController
  before_action :set_requirement, only: [:edit, :update, :destroy]

  # GET /requirements/new
  def new
    @requirement = Requirement.new
    @chapter = Section.find(params[:section_id]).chapter
  end

  # GET /requirements/1/edit
  def edit
  end

  # POST /requirements
  # POST /requirements.json
  def create
    @requirement = Requirement.new(requirement_params)

    respond_to do |format|
      if @requirement.save
        chapter = @requirement.section.chapter
        format.html { redirect_to chapter_path(chapter, anchor: html_tag_id(@requirement)), notice: 'Requirement was successfully created.' }
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
        chapter = @requirement.section.chapter
        format.html { redirect_to chapter_path(chapter, anchor: html_tag_id(@requirement)), notice: 'Requirement was successfully updated.' }
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
    chapter = @requirement.section.chapter
    @requirement.destroy
    respond_to do |format|
      format.html { redirect_to chapter_path(chapter), notice: 'Section was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_requirement
      @requirement = Requirement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def requirement_params
      params.require(:requirement).permit(:number, :content, :reason, :description, :section_id)
    end
end
