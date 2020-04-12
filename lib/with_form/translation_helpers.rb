module WithForm
  module TranslationHelpers
    def submit(model_name, action = :submit)
      translate(action, scope: [:helpers, :submit, model_name])
    end

    def label(model_name, attribute)
      translate(attribute, scope: [:helpers, :label, model_name])
    end
  end
end
