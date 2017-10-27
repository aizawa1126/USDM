require 'test_helper'

class SheetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sheet = sheets(:one)
    @chapter = chapters(:one)
  end

  test "should get new" do
    get new_chapter_sheet_url(@chapter)
    assert_response :success
  end

  test "should create sheet" do
    assert_difference('Sheet.count') do
      post sheets_url, params: { sheet: { chapter_id: @sheet.chapter_id, content: @sheet.content } }
    end

    assert_redirected_to chapter_url(@chapter)
  end

  test "should get edit" do
    get edit_sheet_url(@sheet)
    assert_response :success
  end

  test "should update sheet" do
    patch sheet_url(@sheet), params: { sheet: { chapter_id: @sheet.chapter_id, content: @sheet.content } }
    assert_redirected_to chapter_url(@chapter)
  end

  test "should destroy sheet" do
    assert_difference('Sheet.count', -1) do
      delete sheet_url(@sheet)
    end

    assert_redirected_to sheets_url
  end
end
