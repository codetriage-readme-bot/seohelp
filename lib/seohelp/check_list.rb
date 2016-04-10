##
# Usage:
#   Seohelp::run()
module Seohelp
  ##
  # Usage:
  #   cl = Seohelp::CheckList.new("http://example.com")
  #   cl.check_all
  class CheckList
    def initialize(page)
      # the uri to parse
      @page = page

      # get html from uri
      html = @page =~ /^http/ ? open(@page) : File.open(@page)

      # convert html to nokogiri document
      @doc = Nokogiri::HTML(html)

      # results will be stored here
      @warnings = []
    end

    def check_all
      # get checks, implemented in checks folder, and run them
      Dir[File.join(File.dirname(__FILE__), 'checks', '*.rb')].each do |file|
        require file
        file_name = File.basename(file, '.rb')
        class_name = "Seohelp::#{file_name.split('_').map(&:capitalize).join}"
        check = Object.const_get(class_name).new(@doc)
        @warnings += check.check
      end

      @warnings
    end
  end
end
