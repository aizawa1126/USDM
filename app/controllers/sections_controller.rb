class SectionsController < ApplicationController
  before_action :set_section, only: [:edit, :update, :destroy]

  # GET /sections/new
  def new
    @section = Section.new
    @chapter = Chapter.find(params[:chapter_id])
  end

  # GET /sections/1/edit
  def edit
  end

  # POST /sections
  # POST /sections.json
  def create
    @section = Section.new(section_params)
    @chapter = @section.chapter

    respond_to do |format|
      if @section.save
        format.html { redirect_to chapter_path(@chapter, anchor: html_tag_id(@section)) }
        format.json { render :show, status: :created, location: @section }
      else
        format.html { render :new }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sections/1
  # PATCH/PUT /sections/1.json
  def update
    respond_to do |format|
      if @section.update(section_params)
        chapter = @section.chapter
        format.html { redirect_to chapter_path(chapter, anchor: html_tag_id(@section)) }
        format.json { render :show, status: :ok, location: @section }
      else
        format.html { render :edit }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sections/1
  # DELETE /sections/1.json
  def destroy
    chapter = @section.chapter
    @section.destroy
    respond_to do |format|
      format.html { redirect_to chapter_path(chapter) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_section
      @section = Section.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def section_params
      params.require(:section).permit(:number, :name, :chapter_id)
    end
end
