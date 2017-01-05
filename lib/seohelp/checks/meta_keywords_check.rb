module Seohelp
  ##
  # Page meta keywords check
  # - must be present
  # - must not be empty
  class MetaKeywordsCheck < Seohelp::Check
    def check
      if !keywords
        @warnings << 'Keywords meta tag not found'
      elsif keywords.attributes['content'].nil? ||
            keywords.attributes['content'].value.empty?
        @warnings << 'Empty keywords meta tag'
      end

      @warnings
    end
  end
end
