require 'test_helper'

##
# Description check tests
class DescriptionTest < Seohelp::TestCase
  test 'warn when no meta description present' do
    wrong_html = fixture 'wrong_page.html'
    warnings = Seohelp.run(wrong_html)
    assert_includes warnings, 'Description meta tag not found'
  end

  test 'warn when description present but empty' do
    wrong_html = fixture 'description/empty_description_page.html'
    warnings = Seohelp.run(wrong_html)
    assert_includes warnings, 'Empty description meta tag'

    wrong_html = fixture 'description/empty_description_page2.html'
    warnings = Seohelp.run(wrong_html)
    assert_includes warnings, 'Empty description meta tag'
  end
end
