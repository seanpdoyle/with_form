require "with_form/model_form"
require "with_form/scope_form"

module WithForm
  module TestHelpers
    def with_form(scope: nil, model: nil, &block)
      if model.present?
        WithForm::ModelForm.new(model: model, page: page).yield_self(&block)
      elsif scope.present?
        WithForm::ScopeForm.new(scope: scope, page: page).yield_self(&block)
      else
        raise "with_form must be invoked with either a scope: or model: option"
      end
    end
  end
end
