class SpecsController < ApplicationController
  before_action :set_spec, only: [:edit, :update, :destroy]

  # GET /specs/new
  def new
    @spec = Spec.new
    @chapter = Function.find(params[:function_id]).requirement.section.chapter
  end

  # GET /specs/1/edit
  def edit
  end

  # POST /specs
  # POST /specs.json
  def create
    @spec = Spec.new(spec_params)
    @chapter = @spec.function.requirement.section.chapter
    respond_to do |format|
      if @spec.save
        format.html { redirect_to chapter_path(@chapter, anchor: html_tag_id(@spec)) }
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
        chapter = @spec.function.requirement.section.chapter
        format.html { redirect_to chapter_path(chapter, anchor: html_tag_id(@spec)) }
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
    chapter = @spec.function.requirement.section.chapter
    @spec.destroy
    respond_to do |format|
      format.html { redirect_to chapter_path(chapter) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spec
      @spec = Spec.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def spec_params
      params.require(:spec).permit(:number, :content, :function_id, :customer_review, :design_review, :test_review, :picture)
    end
end
