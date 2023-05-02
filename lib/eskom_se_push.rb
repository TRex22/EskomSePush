require 'httparty'
require 'nokogiri'

require 'api-pattern'

require 'eskom_se_push/version'
require 'eskom_se_push/constants'

require 'eskom_se_push/client'

module EskomSePush
  class Error < StandardError; end
end
