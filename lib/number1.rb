require_relative 'helper';

module Squilliam
  class Number1
    def self.run(p, b, dictionary)
      dictionary.each do |item|
        bfr = (b/item["r"]).floor
        fanout = (b/(item["v"]+p)).floor
        puts 'BFR ' + item["title"] + ' : ' + bfr.to_s
        puts 'Fan Out Ratio ' + item["title"] + ' : ' + fanout.to_s
      end
    end
  end
end
