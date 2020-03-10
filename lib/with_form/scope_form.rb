module WithForm
  class ScopeForm
    include ActionView::Helpers::TranslationHelper

    delegate :check, :uncheck, :choose, to: :@page

    def initialize(scope:, page:)
      @page = page
      @scope = scope
    end

    def fill_in(attribute, with:, **options)
      @page.fill_in label(attribute), with: with, **options
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
      translate(action || :submit, scope: [:helpers, :submit, @scope])
    end

    def label(attribute)
      translate(attribute, scope: [:helpers, :label, @scope])
    end
  end
end
