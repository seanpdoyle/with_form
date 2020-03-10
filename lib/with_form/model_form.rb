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

    def attach_file(attribute, path = nil, **options)
      scope_form.attach_file(
        attribute,
        path || @model.public_send(attribute),
        **options,
      )
    end

    def check(attribute, **options)
      case attribute
      when Symbol
        values = Array(@model.public_send(attribute))
      else
        values = Array(attribute)
      end

      values.each { |value| scope_form.check(value, **options) }
    end

    def uncheck(attribute, **options)
      case attribute
      when Symbol
        values = Array(@model.public_send(attribute))
      else
        values = Array(attribute)
      end

      values.each { |value| scope_form.uncheck(value, **options) }
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
