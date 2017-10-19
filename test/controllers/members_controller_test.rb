require 'test_helper'

class MembersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @specification = specifications(:one)
    @member = members(:one)
  end

  test "should get index" do
    get specification_members_url(@specification)
    assert_response :success
  end

  test "should get new" do
    get new_specification_member_url(@specification)
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

    assert_redirected_to specification_members_url(@specification)
  end
end
