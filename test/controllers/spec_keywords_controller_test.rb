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

  test "should create spec_keyword" do
    assert_difference('SpecKeyword.count') do
      post spec_keywords_url, params: { spec_keyword: { keyword_id: 2, spec_id: @spec_keyword.spec_id } }
    end

    assert_redirected_to chapter_url(@chapter)
  end

  test "should destroy spec_keyword" do
    assert_difference('SpecKeyword.count', -1) do
      delete spec_keyword_url(@spec_keyword)
    end

    assert_redirected_to edit_spec_url(@spec)
  end
end
