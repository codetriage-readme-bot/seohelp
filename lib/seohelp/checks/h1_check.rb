module Seohelp
  ##
  # H1 tag check
  # - must be present
  # - must not be empty
  # - must be unique (only one)
  class H1Check < Seohelp::Check
    def check
      h1 = @doc.css('h1')
      if h1.count == 0
        @warnings << 'h1 not found'
      elsif h1.count > 1
        @warnings << 'more than 1 h1 present'
      elsif h1.first.text.empty? # todo: add blank? ?
        @warnings << 'empty h1'
      end

      @warnings
    end
  end
end
