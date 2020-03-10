module WithForm
  class Form
    include ActionView::Helpers::TranslationHelper

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

    def label(attribute)
      translate(attribute, scope: [:helpers, :label, @scope])
    end
  end
end
