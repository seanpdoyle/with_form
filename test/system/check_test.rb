require "application_system_test_case"

class CheckTest < ApplicationSystemTestCase
  test "check with scope and String argument" do
    visit new_widget_path

    with_form(scope: :widget) do |form|
      form.check "Ruby"
    end

    assert_checked_field "Ruby"
  end

  test "check with scope and Symbol argument" do
    visit new_widget_path

    with_form(scope: :widget) do |form|
      form.check :single_checkbox_field
    end

    assert_checked_field translate("helpers.label.widget.single_checkbox_field")
  end

  test "check with model-backed array" do
    widget = Widget.new(checkbox_field: ["Ruby", "Java"])

    visit new_widget_path
    with_form(model: widget) do |form|
      form.check :checkbox_field
    end

    assert_checked_field "Ruby"
    assert_checked_field "Java"
  end

  test "check with overridable model" do
    widget = Widget.new(checkbox_field: ["JavaScript"])

    visit new_widget_path
    with_form(model: widget) do |form|
      form.check "Ruby"
    end

    assert_checked_field "Ruby"
  end
end

class RecordCheckTest < ApplicationSystemTestCase
  test "check with nil value and Symbol argument" do
    widget_record = WidgetRecord.new(boolean_check_box_field: nil)
    visit new_widget_record_path

    with_form(model: widget_record) do |form|
      form.check :boolean_check_box_field
    end

    assert_checked_field translate("helpers.label.widget_record.boolean_check_box_field")
  end

  test "check with true value and Symbol argument" do
    widget_record = WidgetRecord.new(boolean_check_box_field: true)
    visit new_widget_record_path

    with_form(model: widget_record) do |form|
      form.check :boolean_check_box_field
    end

    assert_checked_field translate("helpers.label.widget_record.boolean_check_box_field")
  end

  test "check with false value and Symbol argument" do
    widget_record = WidgetRecord.new(boolean_check_box_field: false)
    visit new_widget_record_path

    with_form(model: widget_record) do |form|
      form.check :boolean_check_box_field
    end

    assert_checked_field translate("helpers.label.widget_record.boolean_check_box_field")
  end
end
