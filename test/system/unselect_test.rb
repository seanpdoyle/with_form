require "application_system_test_case"

class UnselectTest < ApplicationSystemTestCase
  test "unselect" do
    visit new_widget_path

    with_form(scope: :widget) do |form|
      form.select "Bad", from: :multiple_select_field
      form.unselect "Bad", from: :multiple_select_field
    end

    assert_no_field translate("helpers.label.widget.multiple_select_field"), with: "Bad"
  end
end
