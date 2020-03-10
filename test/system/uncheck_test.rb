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
