class TitleCheck < Check

	def check
		title = @doc.at_css('title')
		if title && title.content.length > 160
			@warnings << "Title should be shorter than 160 characters"
		end

		@warnings
	end
	
end

