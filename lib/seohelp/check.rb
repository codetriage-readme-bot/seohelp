module Seohelp
  ##
  # Checks base class
  class Check
    def initialize(doc)
      @doc = doc
      @warnings = []
    end

    def title
      @doc.at_css('title')
    end

    def keywords
      @doc.at_css('meta[name=keywords]')
    end
  end
end
