require 'test_helper'

class SpecKeywordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @spec_keyword = spec_keywords(:one)
    @spec = specs(:one)
    @keyword = keywords(:one)
    @chapter = chapters(:one)
    @section = sections(:one)
    @requirement = requirements(:one)
    @function = functions(:one)
  end

  test "should get index" do
    get spec_keywords_url
    assert_response :success
  end

  test "should get new" do
    get new_spec_keyword_url
    assert_response :success
  end

  test "should create spec_keyword" do
    assert_difference('SpecKeyword.count') do
      post spec_keywords_url, params: { spec_keyword: { keyword_id: @spec_keyword.keyword_id, spec_id: @spec_keyword.spec_id } }
    end

    assert_redirected_to chapter_url(@chapter)
  end

  test "should show spec_keyword" do
    get spec_keyword_url(@spec_keyword)
    assert_response :success
  end

  test "should get edit" do
    get edit_spec_keyword_url(@spec_keyword)
    assert_response :success
  end

  test "should update spec_keyword" do
    patch spec_keyword_url(@spec_keyword), params: { spec_keyword: { keyword_id: @spec_keyword.keyword_id, spec_id: @spec_keyword.spec_id } }
    assert_redirected_to spec_keyword_url(@spec_keyword)
  end

  test "should destroy spec_keyword" do
    assert_difference('SpecKeyword.count', -1) do
      delete spec_keyword_url(@spec_keyword)
    end

    assert_redirected_to spec_keywords_url
  end
end
