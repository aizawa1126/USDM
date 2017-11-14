class MembersController < ApplicationController
  before_action :set_member, only: [:edit, :update, :destroy]
  helper_method :set_role_id

  # GET /members
  # GET /members.json
  def index
    @members = Member.where(project_id: params[:project_id].to_i)
    @project = Project.find(params[:project_id])
  end

  # GET /members/new
  def new
    @users = User.all
    @member = Member.new
    @project = Project.find(params[:project_id])
  end

  # POST /members
  # POST /members.json
  def create
    @member = Member.new(member_params)
    @project = @member.project

    Member.transaction do
      @member.save!
      no_role = true

      params[:member_roles].each do |role_name, value|
        if value.to_i == 1
          no_role = false
          role_id = set_role_id(role_name)
          @member_role = MemberRole.new(member_id: @member.id, role_id: role_id)
          @member_role.save!
        end
      end

      raise if no_role
    end
    redirect_to project_members_path(@project.id)
  rescue
    @users = User.all
    @member = Member.new
    @project = Project.find(params[:project_id])
    render :new
  end

  def edit
    @member = Member.find(params[:id])
    @project = @member.project
  end

  def update
    @project = @member.project

    MemberRole.transaction do
      params[:member_roles].each do |role_name, value|
        role_id = set_role_id(role_name)
        @member_role = MemberRole.find_by(member_id: @member.id, role_id: role_id)
        if @member_role.nil? && value.to_i == 1
          @member_role = MemberRole.new(member_id: @member.id, role_id: role_id)
          @member_role.save!
        elsif @member_role && value.to_i == 0
          @member_role.destroy!
        end
      end
    end
    redirect_to project_members_path(@project.id)
  rescue
    render :edit
  end


  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @project = @member.project
    @member.destroy
    respond_to do |format|
      format.html { redirect_to project_members_path(@project.id) }
      format.json { head :no_content }
    end
  end

  def set_role_id role_name
    Role.find_by(name: role_name).id
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_params
      params.require(:member).permit(:user_id, :project_id)
    end
end
