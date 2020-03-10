require "application_system_test_case"

class FillInTest < ApplicationSystemTestCase
  test "fill in form fields" do
    visit new_widget_path

    with_form(scope: :widget) do |form|
      form.fill_in :text_field, with: "text value"
      form.fill_in :text_area_field, with: "textarea value"
    end

    assert_field translate("helpers.label.widget.text_field"), with: "text value"
    assert_field translate("helpers.label.widget.text_area_field"), with: "textarea value"
  end
end
