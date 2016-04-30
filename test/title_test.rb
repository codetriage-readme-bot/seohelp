require 'test_helper'

##
# Title check tests
class TitleTest < Seohelp::TestCase
  test 'warn when title is too long' do
    wrong_html = fixture 'wrong_page.html'
    warnings = Seohelp.run(wrong_html)
    assert_includes warnings, 'Title should be shorter than 160 characters'
  end
end
