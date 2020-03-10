$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "with_form/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "with_form"
  spec.version     = WithForm::VERSION
  spec.authors     = ["Sean Doyle"]
  spec.email       = ["sean.p.doyle24@gmail.com"]
  spec.homepage    = "https://github.com/seanpdoyle/with_form"
  spec.summary     = "Your System Test's counterpart to `form_with`"
  spec.description = "Leverage Rails-generated <label> values to submit <form> elements in System Tests"
  spec.license     = "MIT"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.0.2", ">= 6.0.2.1"
  spec.add_dependency "capybara", ">= 2.15"

  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "selenium-webdriver"
  spec.add_development_dependency "webdrivers"
end
