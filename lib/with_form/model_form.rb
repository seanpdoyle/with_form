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

    def select(attribute, from: nil, **options)
      case attribute
      when Symbol
        value = @model.public_send(attribute)
      else
        value = attribute
      end

      scope_form.select value, from: from || attribute, **options
    end

    def unselect(attribute, from: nil, **options)
      case attribute
      when Symbol
        value = @model.public_send(attribute)
      else
        value = attribute
      end

      scope_form.unselect value, from: from || attribute, **options
    end

    private

    def scope_form
      WithForm::ScopeForm.new(scope: @model.model_name.i18n_key, page: @page)
    end
  end
end
