require "application_system_test_case"

class AttachFileTest < ApplicationSystemTestCase
  test "attach file" do
    visit new_widget_path

    with_form(scope: :widget) do |form|
      form.attach_file :file_field, file_fixture("file.txt")
    end

    assert_field translate("helpers.label.widget.file_field"), with: "C:\\fakepath\\file.txt"
  end
end
