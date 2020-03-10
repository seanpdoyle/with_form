module WithForm
  class ModelForm
    include ActionView::Helpers::TranslationHelper

    def initialize(model:, page:)
      @page = page
      @model = model
    end

    def fill_in(attribute, with: nil, **options)
      scope_form.fill_in(
        attribute,
        with: with || @model.public_send(attribute),
        **options,
      )
    end

    private

    def scope_form
      WithForm::ScopeForm.new(scope: @model.model_name.i18n_key, page: @page)
    end
  end
end
