module WithForm
  class Engine < ::Rails::Engine
    ActiveSupport.on_load :action_dispatch_system_test_case do
      Capybara.add_selector :rich_text_area do
        label "rich-text area"
        xpath do |locator|
          if locator.nil?
            XPath.descendant(:"trix-editor")
          else
            input_located_by_name = XPath.anywhere(:input).where(XPath.attr(:name) == locator).attr(:id)

            XPath.descendant(:"trix-editor").where \
              XPath.attr(:id).equals(locator) |
              XPath.attr(:placeholder).equals(locator) |
              XPath.attr(:"aria-label").equals(locator) |
              XPath.attr(:input).equals(input_located_by_name)
          end
        end
      end
    end
  end
end
