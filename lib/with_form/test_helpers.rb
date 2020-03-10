require "with_form/form"

module WithForm
  module TestHelpers
    def with_form(scope:, &block)
      WithForm::Form.new(scope: scope, page: page).yield_self(&block)
    end
  end
end
