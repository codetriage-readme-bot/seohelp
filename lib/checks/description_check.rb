class DescriptionCheck < Check

	def check
		description = @doc.at_css('meta[name=description]')
		if !description
			@warnings << "Description meta tag not found"
		elsif description.attributes['value'].value.length == 0
			@warnings << "Empty description meta tag"
		end

		@warnings
	end
	
end

