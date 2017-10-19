require 'test_helper'

class ChaptersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @specification = specifications(:one)
    @chapter = chapters(:one)
  end

  test "should get new" do
    get new_specification_chapter_url(@specification)
    assert_response :success
  end

  test "should create chapter" do
    assert_difference('Chapter.count') do
      post specification_chapters_url(@specification), params: { chapter: { name: @chapter.name, number: @chapter.number, prefix: @chapter.prefix, specification_id: @chapter.specification_id } }
    end

    assert_redirected_to specification_url(@specification)
  end

  test "should show chapter" do
    get chapter_url(@chapter)
    assert_response :success
  end

  test "should get edit" do
    get edit_chapter_url(@chapter)
    assert_response :success
  end

  test "should update chapter" do
    patch chapter_url(@chapter), params: { chapter: { name: @chapter.name, number: @chapter.number, prefix: @chapter.prefix, specification_id: @chapter.specification_id } }
    assert_redirected_to specification_url(@specification)
  end

  test "should destroy chapter" do
    assert_difference('Chapter.count', -1) do
      delete chapter_url(@chapter)
    end

    assert_redirected_to specification_url(@specification)
  end
end
