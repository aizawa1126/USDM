class MembersController < ApplicationController
  before_action :set_member, only: [:show, :edit, :update, :destroy]

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

    respond_to do |format|
      if @member.save
        format.html { redirect_to specification_members_path(@specification.id), notice: 'Member was successfully created.' }
        format.json { render :show, status: :created, location: @member }
      else
        format.html { render :new }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
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
