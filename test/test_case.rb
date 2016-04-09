##
# Seohelp::TestCase class
module Seohelp
  begin
    require 'minitest/autorun'
    begin
      # 2.0.0
      class TestCase < MiniTest::Test; end
    rescue NameError
      # 1.9.3
      class TestCase < MiniTest::Unit::TestCase; end
    end
  rescue LoadError
    # 1.8.7
    require 'test/unit'
    # not using minitest
    class TestCase < Test::Unit::TestCase
      def default_test; end
    end
  end

  ##
  # Base class for any test case
  class TestCase
    class << self
      def setup(&block)
        define_method(:setup) do
          super()
          instance_eval(&block)
        end
      end

      def test(name, &block)
        define_method("test_#{name}".to_sym, &block)
      end
    end
  end
end
