require "with_form/scope_form"

module WithForm
  module TestHelpers
    def with_form(scope:, &block)
      WithForm::ScopeForm.new(scope: scope, page: page).yield_self(&block)
    end
  end
end
