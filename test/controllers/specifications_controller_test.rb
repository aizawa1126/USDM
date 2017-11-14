require 'test_helper'

class SpecificationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @specification = specifications(:one)
    @project = projects(:one)
  end

  test "should get new" do
    get new_project_specification_url(@project)
    assert_response :success
  end

  test "should create specification" do
    assert_difference('Specification.count') do
      post project_specifications_url(@project), params: { specification: { title: "new specification title", version: 1, project_id: @project.id } }
    end

    assert_redirected_to specification_url(Specification.last)
  end

  test "should get edit" do
    get edit_specification_url(@specification)
    assert_response :success
  end

  test "should update specification" do
    patch specification_url(@specification), params: { specification: { title: @specification.title, version: @specification.version } }
    assert_redirected_to specification_url(@specification)
  end

  test "should destroy specification" do
    assert_difference('Specification.count', -1) do
      delete specification_url(@specification)
    end

    assert_redirected_to project_url(@project)
  end
end
