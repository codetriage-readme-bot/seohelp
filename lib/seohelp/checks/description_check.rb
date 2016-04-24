module Seohelp
  ##
  # Page meta description check
  # Must be present, must not be empty
  class DescriptionCheck < Seohelp::Check
    def check
      description = @doc.at_css('meta[name=description]')
      if !description
        @warnings << 'Description meta tag not found'
      elsif description.attributes['content'].nil? ||
            description.attributes['content'].value.empty?
        @warnings << 'Empty description meta tag'
      end

      @warnings
    end
  end
end
