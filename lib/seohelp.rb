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
			title = doc.at_css('title')
			if title && title.content.length > 160
				@warnings << "Title should be shorter than 160 characters"
			end
			
			description = doc.at_css('meta[name=description]')
			if !description
				@warnings << "Description meta tag not found"
			elsif description.attributes['value'].value.length == 0
				@warnings << "Empty description meta tag"
			end

			return @warnings
		end

	end

end