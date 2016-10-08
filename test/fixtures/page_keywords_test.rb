require 'test_helper'

##
# Description check tests
class PageKeywordsTest < Seohelp::TestCase
  test 'warn when no keywords detected on content' do
    wrong_html = fixture 'page_without_keywords_in_content.html'
    warnings = Seohelp.run(wrong_html)
    assert_includes warnings, 'Keywords meta tag not found'
  end

  test 'warn when keywords present but empty' do
    wrong_html = fixture 'empty_keywords_page.html'
    warnings = Seohelp.run(wrong_html)
    assert_includes warnings, 'Empty keywords meta tag'

    wrong_html = fixture 'empty_keywords_page2.html'
    warnings = Seohelp.run(wrong_html)
    assert_includes warnings, 'Empty keywords meta tag'
  end
end
