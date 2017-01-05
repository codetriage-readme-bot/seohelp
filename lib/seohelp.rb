require 'nokogiri'
require 'open-uri'
require 'i18n'

require 'seohelp/check'
require 'seohelp/check_list'

##
# Usage:
#   Seohelp::run()
module Seohelp
  def self.run(page)
    check_list = Seohelp::CheckList.new(page)
    check_list.check_all
  end
end
