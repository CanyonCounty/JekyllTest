# Just a guess to see if this works
require 'open-uri'

module Jekyll
  class FetchGenerator < Generator
    safe true # not sure if this is a true statement, lol
    def generate(site)
      Dir.mkdir('scripts') unless Dir.exists?('scripts')

      open('scripts/PrecinctInfo.js', 'w') do |file|
        file << open('http://www.canyonco.org/CanyonCounty/Webparts/Elections/js/PrecinctInfo.js?v2').read
      end
    end
  end
end