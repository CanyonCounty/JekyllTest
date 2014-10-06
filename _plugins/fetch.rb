# Just a guess to see if this works
require 'open-uri'

module Jekyll
  class FetchGenerator < Generator
    safe true # not sure if this is a true statement, lol
    def generate(site)
      Dir.mkdir('scripts') unless Dir.exists?('scripts')
      Dir.mkdir('_data') unless Dir.exists?('_data')
      Dir.mkdir('_data/jailRoster') unless Dir.exists?('_data/jailRoster')

      open('scripts/PrecinctInfo.js', 'w') do |file|
        file << open('http://www.canyonco.org/CanyonCounty/Webparts/Elections/js/PrecinctInfo.js?v2').read
      end

      open('_data/arrests.json', 'w') do |file|
        file << open('http://secret.canyonco.org/Sheriff/CurrentArrest').read
      end

      open('_data/jailList.json', 'w') do |file|
        file << open('http://secret.canyonco.org/Sheriff/JailList').read
      end      
    end
  end
end