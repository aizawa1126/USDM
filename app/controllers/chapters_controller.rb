class ChaptersController < ApplicationController
  before_action :set_chapter, only: [:show, :edit, :update, :destroy]

  # GET /chapters/1
  # GET /chapters/1.json
  def show
    @specification = @chapter.specification
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "specs",
             encoding: "UTF-8",
             layout: "pdf.html.erb"
      end
    end
  end

  # GET /chapters/new
  def new
    @chapter = Chapter.new
    @specification = Specification.find(params[:specification_id])
  end

  # GET /chapters/1/edit
  def edit
    @specification = @chapter.specification
  end

  # POST /chapters
  # POST /chapters.json
  def create
    @chapter = Chapter.new(create_chapter_params)
    @specification = @chapter.specification

    respond_to do |format|
      if @chapter.save
        format.html { redirect_to specification_path(@specification.id) }
        format.json { render :show, status: :created, location: @chapter }
      else
        format.html { render :new }
        format.json { render json: @chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chapters/1
  # PATCH/PUT /chapters/1.json
  def update
    respond_to do |format|
      if @chapter.update(update_chapter_params)
        format.html { redirect_to specification_path(@chapter.specification_id) }
        format.json { render :show, status: :ok, location: @chapter }
      else
        format.html { render :edit }
        format.json { render json: @chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chapters/1
  # DELETE /chapters/1.json
  def destroy
    specification = @chapter.specification
    @chapter.destroy
    respond_to do |format|
      format.html { redirect_to specification_path(specification) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chapter
      @chapter = Chapter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def create_chapter_params
      params.require(:chapter).permit(:number, :name, :prefix, :specification_id, :format)
    end

    def update_chapter_params
      params.require(:chapter).permit(:number, :name, :prefix, :specification_id)
    end
end
