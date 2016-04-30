require 'test_helper'

##
# Right page tests
class RightPageTest < Seohelp::TestCase
  test 'right page has no warnings' do
    right_html = fixture 'right_page.html'
    warnings = Seohelp.run(right_html)
    assert_empty warnings
  end
end
