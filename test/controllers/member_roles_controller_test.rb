require 'test_helper'

class MemberRolesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @member_role = member_roles(:one)
  end

  test "should get index" do
    get member_roles_url
    assert_response :success
  end

  test "should get new" do
    get new_member_role_url
    assert_response :success
  end

  test "should create member_role" do
    assert_difference('MemberRole.count') do
      post member_roles_url, params: { member_role: { member_id: @member_role.member_id, role_id: @member_role.role_id } }
    end

    assert_redirected_to member_role_url(MemberRole.last)
  end

  test "should show member_role" do
    get member_role_url(@member_role)
    assert_response :success
  end

  test "should get edit" do
    get edit_member_role_url(@member_role)
    assert_response :success
  end

  test "should update member_role" do
    patch member_role_url(@member_role), params: { member_role: { member_id: @member_role.member_id, role_id: @member_role.role_id } }
    assert_redirected_to member_role_url(@member_role)
  end

  test "should destroy member_role" do
    assert_difference('MemberRole.count', -1) do
      delete member_role_url(@member_role)
    end

    assert_redirected_to member_roles_url
  end
end
