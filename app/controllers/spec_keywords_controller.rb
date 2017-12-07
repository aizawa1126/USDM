class SpecKeywordsController < ApplicationController
  before_action :set_spec_keyword, only: [:show, :edit, :update, :destroy]

  # GET /spec_keywords
  # GET /spec_keywords.json
  def index
    @spec_keywords = SpecKeyword.all
  end

  # GET /spec_keywords/1
  # GET /spec_keywords/1.json
  def show
  end

  # GET /spec_keywords/new
  def new
    @spec_keyword = SpecKeyword.new
  end

  # GET /spec_keywords/1/edit
  def edit
  end

  # POST /spec_keywords
  # POST /spec_keywords.json
  def create
    @spec_keyword = SpecKeyword.new(spec_keyword_params)
    @chapter = @spec_keyword.spec.function.requirement.section.chapter

    respond_to do |format|
      if @spec_keyword.save
        format.html { redirect_to chapter_path(@chapter) }
        format.json { render :show, status: :created, location: @spec_keyword }
      else
        format.html { render :new }
        format.json { render json: @spec_keyword.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spec_keywords/1
  # PATCH/PUT /spec_keywords/1.json
  def update
    respond_to do |format|
      if @spec_keyword.update(spec_keyword_params)
        format.html { redirect_to @spec_keyword, notice: 'Spec keyword was successfully updated.' }
        format.json { render :show, status: :ok, location: @spec_keyword }
      else
        format.html { render :edit }
        format.json { render json: @spec_keyword.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spec_keywords/1
  # DELETE /spec_keywords/1.json
  def destroy
    @spec_keyword.destroy
    respond_to do |format|
      format.html { redirect_to spec_keywords_url, notice: 'Spec keyword was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spec_keyword
      @spec_keyword = SpecKeyword.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def spec_keyword_params
      params.require(:spec_keyword).permit(:spec_id, :keyword_id)
    end
end
