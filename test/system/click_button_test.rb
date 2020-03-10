require "application_system_test_case"

class ClickButtonTest < ApplicationSystemTestCase
  test "click_button with scope" do
    visit new_widget_path

    with_form(scope: :widget) do |form|
      form.click_button
    end

    assert_text translate("helpers.submit.widget.submit")
  end

  test "click_button with model" do
    widget = Widget.new

    visit new_widget_path
    with_form(model: widget) do |form|
      form.click_button
    end

    assert_text translate("helpers.submit.widget.create")
  end

  test "click_button with overridable model" do
    widget = Widget.new

    visit new_widget_path
    with_form(model: widget) do |form|
      form.click_button :submit
    end

    assert_text translate("helpers.submit.widget.submit")
  end
end
