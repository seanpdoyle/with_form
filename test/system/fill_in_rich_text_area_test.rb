require "application_system_test_case"

class FillInRichTextAreaTest < ApplicationSystemTestCase
  def setup
    unless defined?(ActionText)
      skip "ActionText is not available in this version of Rails"
    end
  end

  test "fill in rich_text_area in form_with(scope:) on the page" do
    visit new_scopes_rich_widget_path

    with_form(scope: :widget) do |form|
      form.fill_in_rich_text_area :rich_text_area_field, with: "rich textarea value"
    end

    assert_rich_text_area(
      translate("helpers.label.widget.rich_text_area_field"),
      with: "rich textarea value",
    )
  end

  test "fill in rich_text_area in form_with(model:) on the page" do
    model = Widget.new(rich_text_area_field: "rich textarea value")

    visit new_models_rich_widget_path
    with_form(model: model) do |form|
      form.fill_in_rich_text_area :rich_text_area_field
    end

    assert_rich_text_area(
      translate("helpers.label.widget.rich_text_area_field"),
      with: "rich textarea value",
    )
  end

  def assert_rich_text_area(locator, with:, **options)
    input_id = find(:rich_text_area, locator)["input"]

    assert_field(
      input_id,
      type: :hidden,
      with: "<div>#{with}</div>",
      **options,
    )
  end
end
