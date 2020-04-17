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

    def fill_in_rich_text_area(attribute, with: nil, **options)
      scope_form.fill_in_rich_text_area(
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

    def choose(attribute, **options)
      if attribute.kind_of? Symbol
        value = read_attribute(attribute)
      else
        value = attribute
      end

      scope_form.choose value, **options
    end

    def check(attribute, **options)
      if attribute.kind_of? Symbol
        value = read_attribute(attribute)
      else
        value = attribute
      end

      Array(value).each { |value| scope_form.check(value, **options) }
    end

    def uncheck(attribute, **options)
      if attribute.kind_of? Symbol
        value = read_attribute(attribute)
      else
        value = attribute
      end

      Array(value).each { |value| scope_form.uncheck(value, **options) }
    end

    def select(attribute, from: nil, **options)
      if attribute.kind_of? Symbol
        value = read_attribute(attribute)
      else
        value = attribute
      end

      scope_form.select value, from: from || attribute, **options
    end

    def unselect(attribute, from: nil, **options)
      if attribute.kind_of? Symbol
        value = read_attribute(attribute)
      else
        value = attribute
      end

      scope_form.unselect value, from: from || attribute, **options
    end

    def click_button(action = nil, **options)
      if action.present?
      elsif @model.persisted?
        action = :update
      else
        action = :create
      end

      scope_form.click_button action, **options
    end

    private

    def scope_form
      WithForm::ScopeForm.new(scope: @model.model_name.i18n_key, page: @page)
    end

    def read_attribute(attribute)
      attribute_value = @model.public_send(attribute)

      if attribute_value.in?([true, false, nil])
        attribute
      else
        attribute_value
      end
    end
  end
end
