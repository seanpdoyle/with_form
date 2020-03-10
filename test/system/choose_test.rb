require "application_system_test_case"

class ChooseTest < ApplicationSystemTestCase
  test "choose" do
    visit new_widget_path

    with_form(scope: :widget) do |form|
      form.choose "Up"
    end

    assert_checked_field "Up"
  end
end
