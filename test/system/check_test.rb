require "application_system_test_case"

class CheckTest < ApplicationSystemTestCase
  test "check" do
    visit new_widget_path

    with_form(scope: :widget) do |form|
      form.check "Ruby"
    end

    assert_checked_field "Ruby"
  end
end
