require "application_system_test_case"

class UncheckTest < ApplicationSystemTestCase
  test "uncheck" do
    visit new_widget_path

    with_form(scope: :widget) do |form|
      form.uncheck "Java"
    end

    assert_no_checked_field "Java"
  end
end
