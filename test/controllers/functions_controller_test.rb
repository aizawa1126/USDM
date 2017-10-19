require 'test_helper'

class FunctionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @specification = specifications(:one)
    @chapter = chapters(:one)
    @section = sections(:one)
    @requirement = requirements(:one)
    @function = functions(:one)
  end

  test "should get new" do
    get new_requirement_function_url(@requirement)
    assert_response :success
  end

  test "should create function" do
    assert_difference('Function.count') do
      post requirement_functions_url(@requirement), params: { function: { name: @function.name, requirement_id: @function.requirement_id } }
    end

    assert_redirected_to chapter_url(@chapter, anchor: "function_"+Function.last.id.to_s)
  end

  test "should get edit" do
    get edit_function_url(@function)
    assert_response :success
  end

  test "should update function" do
    patch function_url(@function), params: { function: { name: @function.name, requirement_id: @function.requirement_id } }
    assert_redirected_to chapter_url(@chapter, anchor: "function_" + @function.id.to_s)
  end

  test "should destroy function" do
    assert_difference('Function.count', -1) do
      delete function_url(@function)
    end

    assert_redirected_to chapter_url(@chapter)
  end
end
