require "application_system_test_case"

class FillInTest < ApplicationSystemTestCase
  test "fill in form fields with scope" do
    visit new_widget_path

    with_form(scope: :widget) do |form|
      form.fill_in :text_field, with: "text value"
      form.fill_in :text_area_field, with: "textarea value"
    end

    assert_field translate("helpers.label.widget.text_field"), with: "text value"
    assert_field translate("helpers.label.widget.text_area_field"), with: "textarea value"
  end

  test "fill in form fields with model" do
    widget = Widget.new(
      text_field: "text value",
      text_area_field: "textarea value",
    )

    visit new_widget_path
    with_form(model: widget) do |form|
      form.fill_in :text_field
      form.fill_in :text_area_field
    end

    assert_field translate("helpers.label.widget.text_field"), with: "text value"
    assert_field translate("helpers.label.widget.text_area_field"), with: "textarea value"
  end

  test "fill in form fields with overridden model" do
    widget = Widget.new(
      text_field: "text value",
      text_area_field: "textarea value",
    )

    visit new_widget_path
    with_form(model: widget) do |form|
      form.fill_in :text_field, with: "text value override"
      form.fill_in :text_area_field, with: "textarea value override"
    end

    assert_field translate("helpers.label.widget.text_field"), with: "text value override"
    assert_field translate("helpers.label.widget.text_area_field"), with: "textarea value override"
  end
end
