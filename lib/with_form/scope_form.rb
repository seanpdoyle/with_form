require "with_form/translation_helpers"

module WithForm
  class ScopeForm
    include ActionView::Helpers::TranslationHelper
    include WithForm::TranslationHelpers

    delegate :choose, to: :@page

    def initialize(scope:, page:)
      @page = page
      @scope = scope
    end

    def check(attribute, **options)
      case attribute
      when Symbol
        value = label(attribute)
      else
        value = attribute
      end

      @page.check value, **options
    end

    def uncheck(attribute, **options)
      case attribute
      when Symbol
        value = label(attribute)
      else
        value = attribute
      end

      @page.uncheck value, **options
    end

    def fill_in(attribute, with:, **options)
      @page.fill_in label(attribute), with: with, **options
    end

    def fill_in_rich_text_area(locator = nil, with:)
      fill_in_script = <<~JS
        this.editor.loadHTML(arguments[0])
      JS

      @page.find(:rich_text_area, label(locator)).execute_script(
        fill_in_script,
        with.to_s,
      )
    end

    def select(value, from:, **options)
      @page.select value, from: label(from), **options
    end

    def unselect(value, from:, **options)
      @page.unselect value, from: label(from), **options
    end

    def attach_file(attribute, path, **options)
      @page.attach_file label(attribute), path, **options
    end

    def click_button(action = nil, **options)
      @page.click_button submit(action), **options
    end

    def submit(action = nil)
      super(@scope, action || :submit)
    end

    def label(attribute)
      super(@scope, attribute)
    end
  end
end
