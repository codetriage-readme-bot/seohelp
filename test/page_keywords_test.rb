require 'test_helper'

##
# Description check tests
class PageKeywordsTest < Seohelp::TestCase
  test 'warn when no keywords detected on content' do
    wrong_html = fixture 'page_keywords/page_without_keywords_in_content.html'
    warnings = Seohelp.run(wrong_html)
    assert_includes warnings, 'Keywords not found in content'
  end
end
