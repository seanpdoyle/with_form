require "application_system_test_case"

class UncheckTest < ApplicationSystemTestCase
  test "uncheck with scope" do
    visit new_widget_path

    with_form(scope: :widget) do |form|
      form.uncheck "Java"
    end

    assert_no_checked_field "Java"
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
