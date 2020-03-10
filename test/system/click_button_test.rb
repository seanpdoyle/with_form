require "application_system_test_case"

class ClickButtonTest < ApplicationSystemTestCase
  test "click_button" do
    visit new_widget_path

    with_form(scope: :widget) do |form|
      form.click_button
    end

    assert_text translate("helpers.submit.widget.submit")
  end
end
