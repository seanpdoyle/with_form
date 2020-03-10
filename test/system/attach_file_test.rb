require "application_system_test_case"

class AttachFileTest < ApplicationSystemTestCase
  test "attach file with scope" do
    visit new_widget_path

    with_form(scope: :widget) do |form|
      form.attach_file :file_field, file_fixture("file.txt")
    end

    assert_field translate("helpers.label.widget.file_field"), with: "C:\\fakepath\\file.txt"
  end

  test "attach file with model" do
    widget = Widget.new(file_field: file_fixture("file.txt"))

    visit new_widget_path
    with_form(model: widget) do |form|
      form.attach_file :file_field
    end

    assert_field translate("helpers.label.widget.file_field"), with: "C:\\fakepath\\file.txt"
  end

  test "attach file with overridable model" do
    widget = Widget.new(file_field: file_fixture("other_file.txt"))

    visit new_widget_path
    with_form(model: widget) do |form|
      form.attach_file :file_field, file_fixture("file.txt")
    end

    assert_field translate("helpers.label.widget.file_field"), with: "C:\\fakepath\\file.txt"
  end
end
