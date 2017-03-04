module Seohelp
  ##
  # Images alternate text check
  # - each image must have a non empty alternate text attribute
  # - must not be empty
  class ImagesAlternativeTextCheck < Seohelp::Check
    def check
      images_without_alternate_text = []

      images = @doc.css('img')
      images.each do |image|
        if image.attributes['alt'].nil? ||
           image.attributes['alt'].value.empty?
           images_without_alternate_text << image
        end
      end

      if images_without_alternate_text.any?
        @warnings << "#{images_without_alternate_text.count} images without alternate text"
      end

      @warnings
    end
  end
end
