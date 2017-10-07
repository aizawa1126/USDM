class MembersController < ApplicationController
  before_action :set_member, only: [:edit, :update, :destroy]
  helper_method :set_role_id

  # GET /members
  # GET /members.json
  def index
    @members = Member.where(specification_id: params[:specification_id].to_i)
  end

  # GET /members/new
  def new
    @users = User.all
    @member = Member.new
    @specification = Specification.find(params[:specification_id])
  end

  # POST /members
  # POST /members.json
  def create
    @member = Member.new(member_params)
    @specification = @member.specification

    Member.transaction do
      @member.save!
      params[:member_roles].each do |role_name, value|
        if value.to_i == 1
          role_id = set_role_id(role_name)
          @member_role = MemberRole.new(member_id: @member.id, role_id: role_id)
          @member_role.save!
        end
      end
    end
    redirect_to specification_members_path(@specification.id), notice: 'Member was successfully created.'
  rescue
    @users = User.all
    @member = Member.new
    @specification = Specification.find(params[:specification_id])
    render :new
  end

  def edit
    @member = Member.find(params[:id])
    @specification = @member.specification
  end

  def update
    @specification = @member.specification
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
    redirect_to specification_members_path(@specification.id), notice: 'Member was successfully created.'
  rescue
    render :edit
  end


  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @specification = @member.specification
    @member.destroy
    respond_to do |format|
      format.html { redirect_to specification_members_path(@specification.id), notice: 'Member was successfully destroyed.' }
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
      params.require(:member).permit(:user_id, :specification_id)
    end
end
