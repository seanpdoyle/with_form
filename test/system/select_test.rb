require "application_system_test_case"

class SelectTest < ApplicationSystemTestCase
  test "select with scope" do
    visit new_widget_path

    with_form(scope: :widget) do |form|
      form.select "Great", from: :select_field
    end

    assert_field translate("helpers.label.widget.select_field"), with: "Great"
  end

  test "select with model" do
    widget = Widget.new(select_field: "Great")

    visit new_widget_path
    with_form(model: widget) do |form|
      form.select :select_field
    end

    assert_field translate("helpers.label.widget.select_field"), with: "Great"
  end

  test "select with overridable model" do
    widget = Widget.new(select_field: "Bad")

    visit new_widget_path
    with_form(model: widget) do |form|
      form.select "Great", from: :select_field
    end

    assert_field translate("helpers.label.widget.select_field"), with: "Great"
    assert_no_field translate("helpers.label.widget.select_field"), with: "Bad"
  end
end
