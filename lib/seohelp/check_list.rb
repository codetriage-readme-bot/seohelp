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
        check_file   = File.basename(file, '.rb')
        check_class  = "Seohelp::#{check_file.split('_').map(&:capitalize).join}"
        check_object = Object.const_get(check_class).new(@doc)
        @warnings    += check_object.check
      end

      @warnings
    end
  end
end
