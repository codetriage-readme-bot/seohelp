module Seohelp
  ##
  # Page keywords check
  # - in page content, must be a few words with a higher frequency
  # - # TODO: those words may be the ones specified with options
  class PageKeywordsCheck < Seohelp::Check
    def check
      # http://stackoverflow.com/questions/6129357/getting-viewable-text-words-via-nokogiri
      text =  @doc.at('body').inner_text
      keywords = text.scan(/\w+/)

      frequencies = frequencies(keywords)

      puts frequencies

      # if !keywords
      #   @warnings << 'Keywords meta tag not found'
      # elsif keywords.attributes['content'].nil? ||
      #       keywords.attributes['content'].value.empty?
      #   @warnings << 'Empty keywords meta tag'
      # end

      @warnings
    end

    private

    def frequencies(keywords)
      Hash[
        words.group_by(&:downcase).map{ |word,instances|
          [word,instances.length]
        }.sort_by(&:last).reverse
      ]
    end
  end
end
