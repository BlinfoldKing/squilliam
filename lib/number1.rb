require_relative 'helper';

# BFr = floor(B/R)
# Fanout Ratio = floor(B/v+p)

module Squilliam
  class Number1
    def self.run!
      dict = Squilliam::load_dictionary
      tables = dict[:tables]

      tables.each do |item|
        bfr = (dict[:b]/Float(item[:r])).floor
        fanout = (dict[:b]/Float(item[:v]+dict[:p])).floor
        puts 'BFR ' + item[:title] + ' : ' + bfr.to_s
        puts 'Fan Out Ratio ' + item[:title] + ' : ' + fanout.to_s
      end
      puts

    end
  end
end
