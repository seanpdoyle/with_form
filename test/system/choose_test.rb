require "application_system_test_case"

class ChooseTest < ApplicationSystemTestCase
  test "choose with scope" do
    visit new_widget_path

    with_form(scope: :widget) do |form|
      form.choose "Up"
    end

    assert_checked_field "Up"
  end

  test "choose with model" do
    widget = Widget.new(radio_field: "Up")

    visit new_widget_path
    with_form(model: widget) do |form|
      form.choose :radio_field
    end

    assert_checked_field "Up"
  end

  test "choose with overridable model" do
    widget = Widget.new(radio_field: "Down")

    visit new_widget_path
    with_form(model: widget) do |form|
      form.choose "Up"
    end

    assert_checked_field "Up"
  end
end
