require 'test_helper'

class WarningsTest < Seohelp::TestCase

  test "warn when title is too long" do
  	wrong_html = fixture "wrong_page.html"
    warnings = Seohelp::run(wrong_html)
    assert_includes warnings, "Title should be shorter than 160 characters"
  end

  test "warn when no meta description present" do
  	wrong_html = fixture "wrong_page.html"
    warnings = Seohelp::run(wrong_html)
    assert_includes warnings, "Description meta tag not found"
  end

  test "warn when description present but empty" do
    wrong_html = fixture "empty_description_page.html"
    warnings = Seohelp::run(wrong_html)
    assert_includes warnings, "Empty description meta tag"
  end

  test "right page has no warnings" do
  	right_html = fixture "right_page.html"
    warnings = Seohelp::run(right_html)
    assert_empty warnings
  end

end