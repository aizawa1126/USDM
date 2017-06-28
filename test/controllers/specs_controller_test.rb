require 'test_helper'

class SpecsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @spec = specs(:one)
  end

  test "should get index" do
    get specs_url
    assert_response :success
  end

  test "should get new" do
    get new_spec_url
    assert_response :success
  end

  test "should create spec" do
    assert_difference('Spec.count') do
      post specs_url, params: { spec: { content: @spec.content, function_id: @spec.function_id } }
    end

    assert_redirected_to spec_url(Spec.last)
  end

  test "should show spec" do
    get spec_url(@spec)
    assert_response :success
  end

  test "should get edit" do
    get edit_spec_url(@spec)
    assert_response :success
  end

  test "should update spec" do
    patch spec_url(@spec), params: { spec: { content: @spec.content, function_id: @spec.function_id } }
    assert_redirected_to spec_url(@spec)
  end

  test "should destroy spec" do
    assert_difference('Spec.count', -1) do
      delete spec_url(@spec)
    end

    assert_redirected_to specs_url
  end
end
