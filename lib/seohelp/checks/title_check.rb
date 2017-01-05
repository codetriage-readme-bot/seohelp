module Seohelp
  ##
  # Page title check
  # Must be present and not too long
  class TitleCheck < Seohelp::Check
    def check
      if title && title.content.length > 160
        @warnings << 'Title should be shorter than 160 characters'
      end

      @warnings
    end
  end
end
