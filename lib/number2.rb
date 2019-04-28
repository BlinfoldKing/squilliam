require_relative 'helper';

module Squilliam
  class Number2
    def self.run(p, b, tables)
      tables.each do |item|
        bfr = (b/Float(item["r"])).floor
        fanout = (b/Float(item["v"]+p)).floor
        table = (item["n"]/bfr).ceil
        index = (item["n"]/fanout).ceil
        puts 'Tabel Data ' + item["title"] + ' : ' + table.to_s + ' blok'
        puts 'Indeks ' + item["title"] + " : " + index.to_s + " blok"
      end
    end
  end
end
