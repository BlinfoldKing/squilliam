require_relative 'helper';

module Squilliam
  class Number2
    def self.run!
      dict = Squilliam::load_dictionary
      tables = dict[:tables]
      
      tables.each do |item|
        bfr = (dict[:b]/Float(item[:r])).floor
        fanout = (dict[:b]/Float(item[:v]+dict[:p])).floor
        table = (item[:n]/Float(bfr)).ceil
        index = (item[:n]/Float(fanout)).ceil
        puts 'Tabel Data ' + item[:title] + ' : ' + table.to_s + ' blok'
        puts 'Indeks ' + item[:title] + " : " + index.to_s + " blok"
      end
      puts
      
    end
  end
end
