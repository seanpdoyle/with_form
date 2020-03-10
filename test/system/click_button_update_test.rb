require "application_system_test_case"

class ClickButtonUpdateTest < ApplicationSystemTestCase
  test "click_button update" do
    widget_record = WidgetRecord.create!(text_field: "Created Record")

    visit edit_widget_record_path(widget_record)
    with_form(scope: :widget_record) do |form|
      form.fill_in :text_field, with: "Updated Record"
      form.click_button :update
    end

    assert_text "Updated Record"
    assert_no_text "Created Record"
    assert_equal ["Updated Record"], WidgetRecord.pluck(:text_field)
  end
end
