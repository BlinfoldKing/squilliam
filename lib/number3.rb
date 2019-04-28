require_relative 'helper';

module Squilliam
  class Number3
    def self.run(p, b, tables, recordSearch, tableSearch)
      res = 0
      
      tables.each do |item|
          if item["title"] === tableSearch
              break
          end
          res+=1
      end
      
      bfr = (b/Float(tables[res]["r"])).floor
      fanout = (b/Float(tables[res]["v"]+p)).floor
      withIndex = (recordSearch/fanout).ceil
      withoutIndex = (recordSearch/bfr).ceil

      puts 'Menggunakan indeks, jumlah blok yang diakses : ' + withIndex.to_s + ' blok'
      puts 'Tanpa indeks, jumlah blok yang diakses : ' + withIndex.to_s + ' blok' 
    end
  end
end
