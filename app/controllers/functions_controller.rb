class FunctionsController < ApplicationController
  before_action :set_function, only: [:edit, :update, :destroy]

  # GET /functions/new
  def new
    @function = Function.new
    @chapter = Requirement.find(params[:requirement_id]).section.chapter
  end

  # GET /functions/1/edit
  def edit
  end

  # POST /functions
  # POST /functions.json
  def create
    @function = Function.new(function_params)
    @chapter = @function.requirement.section.chapter
    respond_to do |format|
      if @function.save
        format.html { redirect_to chapter_path(@chapter, anchor: html_tag_id(@function)) }
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
        chapter = @function.requirement.section.chapter
        format.html { redirect_to chapter_path(chapter, anchor: html_tag_id(@function)) }
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
    chapter = @function.requirement.section.chapter
    @function.destroy
    respond_to do |format|
      format.html { redirect_to chapter_path(chapter) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_function
      @function = Function.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def function_params
      params.require(:function).permit(:name, :requirement_id)
    end
end
