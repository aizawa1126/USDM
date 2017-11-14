class SheetsController < ApplicationController
  before_action :set_sheet, only: [:edit, :update, :destroy]

  # GET /sheets/new
  def new
    @sheet = Sheet.new
    @chapter = Chapter.find(params[:chapter_id])
  end

  # GET /sheets/1/edit
  def edit
  end

  # POST /sheets
  # POST /sheets.json
  def create
    @sheet = Sheet.new(sheet_params)
    Sheet.transaction do
      @sheet.save
      @chapter = @sheet.chapter
      if params[:sheet][:sheet_picture].present?
        params[:sheet][:sheet_picture].each do |sheet_picture|
          @sheet_picture = SheetPicture.new(sheet_id: @sheet.id, picture: sheet_picture)
          @sheet_picture.save
        end
      end
    end
    redirect_to chapter_path(@chapter)
  rescue
    @sheet = Sheet.new
    @chapter = Chapter.find(params[:sheet][:chapter_id])
    render :new
  end

  # PATCH/PUT /sheets/1
  # PATCH/PUT /sheets/1.json
  def update
    @chapter = @sheet.chapter
    Sheet.transaction do
      @sheet.update(sheet_params)
      if params[:sheet][:sheet_picture].present?
        params[:sheet][:sheet_picture].each do |sheet_picture|
          @sheet_picture = SheetPicture.new(sheet_id: @sheet.id, picture: sheet_picture)
          @sheet_picture.save
        end
      end
    end
    redirect_to chapter_path(@chapter)
  rescue
    render :edit
  end

  # DELETE /sheets/1
  # DELETE /sheets/1.json
  def destroy
    chapter = @sheet.chapter
    @sheet.destroy
    respond_to do |format|
      format.html { redirect_to chapter, notice: 'Sheet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sheet
      @sheet = Sheet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sheet_params
      params.require(:sheet).permit(:content, :chapter_id)
    end
end
