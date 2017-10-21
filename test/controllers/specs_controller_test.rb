require 'test_helper'

class SpecsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @specification = specifications(:one)
    @chapter = chapters(:one)
    @section = sections(:one)
    @requirement = requirements(:one)
    @function = functions(:one)
    @spec = specs(:one)
  end

  test "should get new" do
    get new_function_spec_url(@function)
    assert_response :success
  end

  test "should create spec" do
    assert_difference('Spec.count') do
      post function_specs_url(@function), params: { spec: { number: 9999, content: "should create spec", function_id: @function.id } }
    end

    assert_redirected_to chapter_url(@chapter, anchor: "spec_" + Spec.last.id.to_s)
  end

  test "should get edit" do
    get edit_spec_url(@spec)
    assert_response :success
  end

  test "should update spec" do
    patch spec_url(@spec), params: { spec: { number: @spec.number, content: @spec.content, function_id: @spec.function_id } }
    assert_redirected_to chapter_url(@chapter, anchor: "spec_"+@spec.id.to_s)
  end

  test "should destroy spec" do
    assert_difference('Spec.count', -1) do
      delete spec_url(@spec)
    end

    assert_redirected_to chapter_url(@chapter)
  end
end
