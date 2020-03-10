require "test_helper"
require "capybara"

Capybara.server = :webrick

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  include ActionView::Helpers::TranslationHelper
  include WithForm::TestHelpers

  driven_by :selenium, using: :chrome, screen_size: [1400, 1400]
end
