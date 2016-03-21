require 'nokogiri'
require 'open-uri'

require 'check'

module Seohelp

	def self.run(page)
		check_list = CheckList.new(page)
		check_list.check_all
	end

	class CheckList

		def initialize(page)
			@page = page
			@warnings = []
		end

		def check_all
			# get html
			html = @page =~ /^http/ ? open(@page) : File.open(@page) 
			doc = Nokogiri::HTML(html)

			# get checks, implemented in checks folder 
			Dir[File.join(File.dirname(__FILE__), 'checks', '*.rb')].each do |file|
			 	require file
				klass = File.basename(file, '.rb').split('_').map{|s| s.capitalize}.join
				check = eval(klass).new(doc)
				@warnings += check.check
			end

			@warnings
		end

	end

end