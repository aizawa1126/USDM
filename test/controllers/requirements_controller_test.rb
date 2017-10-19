require 'test_helper'

class RequirementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @specification = specifications(:one)
    @chapter = chapters(:one)
    @section = sections(:one)
    @requirement = requirements(:one)
  end

  test "should get new" do
    get new_section_requirement_url(@section)
    assert_response :success
  end

  test "should create requirement" do
    assert_difference('Requirement.count') do
      post section_requirements_url(@section), params: { requirement: { content: @requirement.content, description: @requirement.description, number: @requirement.number, reason: @requirement.reason, section_id: @requirement.section_id } }
    end

    assert_redirected_to chapter_url(@chapter, anchor: "requirement_"+Requirement.last.id.to_s)
  end

  test "should get edit" do
    get edit_requirement_url(@requirement)
    assert_response :success
  end

  test "should update requirement" do
    patch requirement_url(@requirement), params: { requirement: { content: @requirement.content, description: @requirement.description, number: @requirement.number, reason: @requirement.reason, section_id: @requirement.section_id } }
    assert_redirected_to chapter_url(@specification, anchor: "requirement_"+@requirement.id.to_s)
  end

  test "should destroy requirement" do
    assert_difference('Requirement.count', -1) do
      delete requirement_url(@requirement)
    end

    assert_redirected_to chapter_url(@specification)
  end
end
