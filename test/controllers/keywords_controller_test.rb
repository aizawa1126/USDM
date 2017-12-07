require 'test_helper'

class KeywordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @keyword = keywords(:one)
    @project = projects(:one)
  end
=begin
  test "should get index" do
    get keywords_url
    assert_response :success
  end
=end
  test "should get new" do
    get new_project_keyword_url(@project)
    assert_response :success
  end
=begin
  test "should create keyword" do
    assert_difference('Keyword.count') do
      post keywords_url, params: { keyword: { name: @keyword.name } }
    end

    assert_redirected_to keyword_url(Keyword.last)
  end

  test "should show keyword" do
    get keyword_url(@keyword)
    assert_response :success
  end

  test "should get edit" do
    get edit_keyword_url(@keyword)
    assert_response :success
  end

  test "should update keyword" do
    patch keyword_url(@keyword), params: { keyword: { name: @keyword.name } }
    assert_redirected_to keyword_url(@keyword)
  end

  test "should destroy keyword" do
    assert_difference('Keyword.count', -1) do
      delete keyword_url(@keyword)
    end

    assert_redirected_to keywords_url
  end
=end
end
