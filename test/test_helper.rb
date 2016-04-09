require 'seohelp'
require 'test_case'
# require 'byebug'

module Seohelp
  ##
  # Seolhelp::TestHelpers
  # Extra helper methods to be included in base TestCase
  module TestHelpers
    protected

      def fixture(name)
        File.expand_path("../fixtures/#{name}", __FILE__)
      end

      def assert_something
      end
  end
end

Seohelp::TestCase.send(:include, Seohelp::TestHelpers)
