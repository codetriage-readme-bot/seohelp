module Seohelp
  ##
  # Page keywords check
  # - in page content, must be a few words with a higher frequency
  # - # TODO: those words may be the ones specified with options
  class PageKeywordsCheck < Seohelp::Check

    MIN_KEYWORD_DIFFERENCE = 2

    def check
      # http://stackoverflow.com/questions/6129357/getting-viewable-text-words-via-nokogiri
      text =  @doc.at('body').inner_text
      puts text
      words = text.scan(/\w+/).keep_if{|word| word.length >= 3}
      puts words
      # ["cat", "cat", "dog", "horse"]

      w_frequencies = word_frequencies(words)
      # [["cat", 2], ["dog", 1], ["horse", 1]]

      # check there are words with higher frequency
      frequencies = w_frequencies.map(&:last).group_by{|count| count}.map(&:first)
      # [2, 1]
      if frequencies.first <= frequencies.last + MIN_KEYWORD_DIFFERENCE
        @warnings << 'Keyword frequency may be too low in page text'
      end

      # check keywords are in page title and keywords meta tag
      page_keywords = w_frequencies[0..2].map(&:first)
      t = title
      k = keywords
      found_in_title = found_in_keywords = false
      page_keywords.each do |word|
        if !found_in_title and t =~ word
          found_in_title = true
        end

        if !found_in_keywords and k =~ word
          found_in_keywords = true
        end
      end

      if !found_in_title
        @warnings << "Page keywords not found in page title. Searched in page title for: #{page_keywords.join(',')}"
      end

      if !found_in_keywords
        @warnings << "Page keywords not found in keywords meta. Searched in keywords meta for: #{page_keywords.join(',')}"
      end

      @warnings
    end

    private

    def word_frequencies(words)
      I18n.available_locales = [:en]
      #Hash[
        words.group_by{
          |word| I18n.transliterate(word).downcase
        }.map{ |word,instances|
          [word,instances.length]
        }.sort_by(&:last).reverse
      #]
    end
  end
end
