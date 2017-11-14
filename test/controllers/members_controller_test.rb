require 'test_helper'

class MembersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @project = projects(:one)
    @member = members(:one)
  end

  test "should get index" do
    get project_members_url(@project)
    assert_response :success
  end

  test "should get new" do
    get new_project_member_url(@project)
    assert_response :success
  end

  test "should get edit" do
    get edit_member_url(@member)
    assert_response :success
  end

  test "should destroy member" do
    assert_difference('Member.count', -1) do
      delete member_url(@member)
    end

    assert_redirected_to project_members_url(@project)
  end
end
