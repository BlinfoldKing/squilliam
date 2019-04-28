require_relative 'helper';

module Squilliam
  class Number1
    def self.run(p, b, tables)
      tables.each do |item|
        bfr = (b/Float(item["r"])).floor
        fanout = (b/Float(item["v"]+p)).floor
        puts 'BFR ' + item["title"] + ' : ' + bfr.to_s
        puts 'Fan Out Ratio ' + item["title"] + ' : ' + fanout.to_s
      end
    end
  end
end
