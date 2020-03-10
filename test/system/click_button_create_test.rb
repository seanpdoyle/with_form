require "application_system_test_case"

class ClickButtonCreateTest < ApplicationSystemTestCase
  test "click_button create" do
    visit new_widget_record_path

    with_form(scope: :widget_record) do |form|
      form.fill_in :text_field, with: "Created Record"
      form.click_button :create
    end

    assert_text "Created Record"
    assert_equal ["Created Record"], WidgetRecord.pluck(:text_field)
  end
end
