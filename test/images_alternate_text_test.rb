require 'test_helper'

##
# Images alternate text check tests
class ImagesAlternativeTextTest < Seohelp::TestCase
  test 'warn when images without alternate text present' do
    wrong_html = fixture 'images_alternate_text/no_alt_and_empty_alt.html'
    warnings = Seohelp.run(wrong_html)
    assert_includes warnings, '2 images without alternate text'
  end
end
