require 'test_helper'

##
# Keywords check tests
class KeywordsTest < Seohelp::TestCase
  test 'warn when no meta keywords present' do
    wrong_html = fixture 'wrong_page.html'
    warnings = Seohelp.run(wrong_html)
    assert_includes warnings, 'Keywords meta tag not found'
  end

  test 'warn when keywords present but empty' do
    wrong_html = fixture 'keywords/empty_keywords_page.html'
    warnings = Seohelp.run(wrong_html)
    assert_includes warnings, 'Empty keywords meta tag'

    wrong_html = fixture 'keywords/empty_keywords_page2.html'
    warnings = Seohelp.run(wrong_html)
    assert_includes warnings, 'Empty keywords meta tag'
  end
end
