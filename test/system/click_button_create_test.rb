require "application_system_test_case"

class ClickButtonCreateTest < ApplicationSystemTestCase
  test "click_button create with scope" do
    visit new_widget_record_path

    with_form(scope: :widget_record) do |form|
      form.fill_in :text_field, with: "Created Record"
      form.click_button :create
    end

    assert_text "Created Record"
    assert_equal ["Created Record"], WidgetRecord.pluck(:text_field)
  end

  test "click_button create with model" do
    widget = WidgetRecord.new

    visit new_widget_record_path
    with_form(model: widget) do |form|
      form.fill_in :text_field, with: "Created Record"
      form.click_button
    end

    assert_text "Created Record"
    assert_equal ["Created Record"], WidgetRecord.pluck(:text_field)
  end

  test "click_button create with overridable model" do
    widget = WidgetRecord.new

    visit new_widget_record_path
    with_form(model: widget) do |form|
      form.fill_in :text_field, with: "Created Record"
      form.click_button :submit
    end

    assert_text "Created Record"
    assert_equal ["Created Record"], WidgetRecord.pluck(:text_field)
  end
end
