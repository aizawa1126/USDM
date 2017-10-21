require 'test_helper'

class SectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @specification = specifications(:one)
    @chapter = chapters(:one)
    @section = sections(:one)
  end

  test "should get new" do
    get new_chapter_section_url(@chapter)
    assert_response :success
  end

  test "should create section" do
    assert_difference('Section.count') do
      post chapter_sections_url(@section.chapter_id), params: { section: { chapter_id: @section.chapter_id.to_s, name: "new section name", number: 9999 }}
    end

    assert_redirected_to chapter_url(@chapter, anchor: "section_"+Section.last.id.to_s)
  end

  test "should get edit" do
    get edit_section_url(@section)
    assert_response :success
  end

  test "should update section" do
    patch section_url(@section), params: { section: { chapter_id: @section.chapter_id, name: @section.name, number: @section.number } }
    assert_redirected_to chapter_url(@chapter, anchor: "section_"+@section.id.to_s)
  end

  test "should destroy section" do
    assert_difference('Section.count', -1) do
      delete section_url(@section)
    end

    assert_redirected_to chapter_url(@chapter)
  end
end
