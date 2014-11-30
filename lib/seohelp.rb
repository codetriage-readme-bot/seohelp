require 'nokogiri'
require 'open-uri'

module Seohelp

	def self.run(page)
		a = Analyzer.new(page)
		a.analyze
	end

	class Analyzer

		def initialize(page)
			@page = page
			@warnings = []
		end

		def analyze
			# obtain html
			html = @page =~ /^http/ ? open(@page) : File.open(@page) 
			doc = Nokogiri::HTML(html)

			# analyze web page
			title = doc.at_css('title').content
			if title.length > 160
				@warnings << "Title should be shorter than 160 characters"
			end
			
			return @warnings
		end

	end

end