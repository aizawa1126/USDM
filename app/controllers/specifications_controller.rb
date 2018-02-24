class SpecificationsController < ApplicationController
  before_action :set_specification, only: [:show, :edit, :update, :destroy, :search]
  before_action :has_read_operation, only: [:show]

  # GET /specifications/1
  # GET /specifications/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "specs",
             encoding: "UTF-8",
             layout: "pdf.html.erb"
      end
    end
  end

  # GET /specifications/new
  def new
    @project = Project.find(params[:project_id])
    @specification = Specification.new
  end

  # GET /specifications/1/edit
  def edit
  end

  # POST /specifications
  # POST /specifications.json
  def create
    @specification = Specification.new(specification_params)
    has_already_been_taken = Specification.where(title: specification_params[:title]).count == 0 ? false : true
    respond_to do |format|
      if !has_already_been_taken && @specification.save
        format.html { redirect_to @specification }
        format.json { render :show, status: :created, location: @specification }
      else
        format.html { render :new }
        format.json { render json: @specification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /specifications/1
  # PATCH/PUT /specifications/1.json
  def update
    specification_version = update_specification_params['version']
    if @specification.version != specification_version.to_i
      dup_specification = @specification.dup
      dup_specification.original_id = @specification.id if dup_specification.original_id.nil?
      dup_specification.save!
      @specification.chapters.each do |chapter|
        dup_chapter = chapter.dup
        dup_chapter.specification_id = dup_specification.id
        dup_chapter.original_id = chapter.id if dup_chapter.original_id.nil?
        dup_chapter.save!

        unless chapter.sheet.nil?
          dup_sheet = chapter.sheet.dup
          dup_sheet.chapter_id = dup_chapter.id
          dup_sheet.original_id = chapter.sheet.id if dup_sheet.original_id.nil?
          dup_sheet.save!

          chapter.sheet.sheet_pictures.each do |sheet_picture|
            dup_sheet_picture = sheet_picture.dup
            dup_sheet_picture.sheet_id = dup_sheet.id
            dup_sheet_picture.original_id = sheet_picture.id if dup_sheet_picture.original_id.nil?
            dup_sheet_picture.save!
          end
        end

        chapter.sections.each do |section|
          dup_section = section.dup
          dup_section.chapter_id = dup_chapter.id
          dup_section.original_id = section.id if dup_section.original_id.nil?
          dup_section.save!


          section.requirements.each do |requirement|
            dup_requirement = requirement.dup
            dup_requirement.section_id = dup_section.id
            dup_requirement.original_id = requirement.id if dup_requirement.original_id.nil?
            dup_requirement.save!

            requirement.functions.each do |function|
              dup_function = function.dup
              dup_function.requirement_id = dup_requirement.id
              dup_function.original_id = function.id if dup_function.original_id.nil?
              dup_function.save!

              function.specs.each do |spec|
                dup_spec = spec.dup
                dup_spec.function_id = dup_function.id
                dup_spec.original_id = spec.id if dup_spec.original_id.nil?
                dup_spec.save!

                spec.spec_keywords.each do |spec_keyword|
                  dup_spec_keyword = spec_keyword.dup
                  dup_spec_keyword.spec_id = dup_spec.id
                  dup_spec_keyword.save!
                end
              end
            end
          end
        end
      end
    end
    respond_to do |format|
      if @specification.update(update_specification_params)
        format.html { redirect_to @specification }
        format.json { render :show, status: :ok, location: @specification }
      else
        format.html { render :edit }
        format.json { render json: @specification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /specifications/1
  # DELETE /specifications/1.json
  def destroy
    project = @specification.project
    @specification.destroy
    respond_to do |format|
      format.html { redirect_to project_path(project) }
      format.json { head :no_content }
    end
  end

  def search
    @specs = Spec.search(params[:id].to_i, params[:search])
    @sheets = Sheet.search(params[:id].to_i, params[:search])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_specification
      @specification = Specification.find(params[:id])
      @project = @specification.project
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def specification_params
      params.require(:specification).permit(:title, :version, :project_id)
    end

    def update_specification_params
      params.require(:specification).permit(:version)
    end
end
