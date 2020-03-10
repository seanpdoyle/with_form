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

    def label(attribute)
      translate(attribute, scope: [:helpers, :label, @scope])
    end
  end
end
