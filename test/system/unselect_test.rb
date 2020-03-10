require "application_system_test_case"

class UnselectTest < ApplicationSystemTestCase
  test "unselect with scope" do
    visit new_widget_path

    with_form(scope: :widget) do |form|
      form.select "Bad", from: :multiple_select_field
      form.unselect "Bad", from: :multiple_select_field
    end

    assert_no_field translate("helpers.label.widget.multiple_select_field"), with: "Bad"
  end

  test "unselect with model" do
    widget = Widget.new(multiple_select_field: "Bad")

    visit new_widget_path
    with_form(model: widget) do |form|
      form.select :multiple_select_field
      form.unselect :multiple_select_field
    end

    assert_no_field translate("helpers.label.widget.multiple_select_field"), with: "Bad"
  end

  test "unselect with overridable model" do
    widget = Widget.new(multiple_select_field: "Good")

    visit new_widget_path
    with_form(model: widget) do |form|
      form.select "Bad", from: :multiple_select_field
      form.unselect "Bad", from: :multiple_select_field
    end

    assert_no_field translate("helpers.label.widget.multiple_select_field"), with: "Bad"
  end
end
