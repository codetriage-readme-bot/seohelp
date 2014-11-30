require 'seohelp'
require 'test_case'

module Seohelp::TestHelpers
  protected
    def fixture(name)
      File.expand_path("../fixtures/#{name}", __FILE__)
    end

    def assert_something
    end
end

Seohelp::TestCase.send(:include, Seohelp::TestHelpers)