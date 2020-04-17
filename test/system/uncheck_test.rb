require "application_system_test_case"

class UncheckTest < ApplicationSystemTestCase
  test "uncheck with scope and String argument" do
    visit new_widget_path

    with_form(scope: :widget) do |form|
      form.uncheck "Java"
    end

    assert_no_checked_field "Java"
  end

  test "uncheck with scope and Symbol argument" do
    visit new_widget_path

    with_form(scope: :widget) do |form|
      form.uncheck :checked_single_checkbox_field
    end

    assert_no_checked_field translate("helpers.label.widget.checked_single_checkbox_field")
  end

  test "uncheck with model-backed array" do
    widget = Widget.new(checkbox_field: ["Java"])

    visit new_widget_path
    with_form(model: widget) do |form|
      form.uncheck :checkbox_field
    end

    assert_no_checked_field "Java"
  end

  test "uncheck with overridable model" do
    widget = Widget.new(checkbox_field: ["JavaScript"])

    visit new_widget_path
    with_form(model: widget) do |form|
      form.uncheck "Java"
    end

    assert_no_checked_field "Java"
  end
end

class RecordUncheckTest < ApplicationSystemTestCase
  test "uncheck with nil value and Symbol argument" do
    widget_record = WidgetRecord.new(boolean_check_box_field: nil)
    visit new_widget_record_path

    with_form(model: widget_record) do |form|
      form.uncheck :boolean_check_box_field
    end

    assert_unchecked_field translate("helpers.label.widget_record.boolean_check_box_field")
  end

  test "uncheck with true value and Symbol argument" do
    widget_record = WidgetRecord.new(boolean_check_box_field: true)
    visit new_widget_record_path

    with_form(model: widget_record) do |form|
      form.uncheck :boolean_check_box_field
    end

    assert_unchecked_field translate("helpers.label.widget_record.boolean_check_box_field")
  end

  test "uncheck with false value and Symbol argument" do
    widget_record = WidgetRecord.new(boolean_check_box_field: false)
    visit new_widget_record_path

    with_form(model: widget_record) do |form|
      form.uncheck :boolean_check_box_field
    end

    assert_unchecked_field translate("helpers.label.widget_record.boolean_check_box_field")
  end

  test "uncheck with association value" do
    tag = Tag.create!(name: "Ruby")
    widget_record = WidgetRecord.create!(tags: [tag])
    visit edit_widget_record_path(widget_record)

    with_form(model: widget_record) do |form|
      form.check tag.name
    end

    assert_unchecked_field tag.name
  end

  test "uncheck with association value Array" do
    tag = Tag.create!(name: "Ruby")
    widget_record = WidgetRecord.create!(tags: [tag])
    visit edit_widget_record_path(widget_record)

    with_form(model: widget_record) do |form|
      form.check [tag.name]
    end

    assert_unchecked_field tag.name
  end

  test "uncheck with association attribute name" do
    tag = Tag.create!(name: "Ruby")
    widget_record = WidgetRecord.create!(tags: [tag])
    visit edit_widget_record_path(widget_record)

    with_form(model: widget_record) do |form|
      form.uncheck :tags
    end

    assert_unchecked_field tag.name
  end

  test "uncheck with association attribute ids" do
    tag = Tag.create!(name: "Ruby")
    widget_record = WidgetRecord.create!(tags: [tag])
    visit edit_widget_record_path(widget_record)

    with_form(model: widget_record) do |form|
      form.uncheck :tag_ids
    end

    assert_unchecked_field tag.name
  end
end
