require 'test_helper'

##
# H1 check tests
class H1Test < Seohelp::TestCase
  test 'warn when no h1 present' do
    wrong_html = fixture 'h1/no_h1.html'
    warnings = Seohelp.run(wrong_html)
    assert_includes warnings, 'h1 not found'
  end

  test 'warn when empty h1 present' do
    wrong_html = fixture 'h1/empty_h1.html'
    warnings = Seohelp.run(wrong_html)
    assert_includes warnings, 'empty h1'
  end

  test 'warn when more than one h1 present' do
    wrong_html = fixture 'h1/more_than_one_h1.html'
    warnings = Seohelp.run(wrong_html)
    assert_includes warnings, 'more than 1 h1 present'
  end
end
