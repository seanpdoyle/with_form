require "application_system_test_case"

class SelectTest < ApplicationSystemTestCase
  test "select" do
    visit new_widget_path

    with_form(scope: :widget) do |form|
      form.select "Great", from: :select_field
    end

    assert_field translate("helpers.label.widget.select_field"), with: "Great"
  end
end
