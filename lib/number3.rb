require_relative 'helper';

module Squilliam
  class Number3
    def self.run!
      dict = Squilliam::load_dictionary
      tables = dict[:tables]

      puts "Input:"
      print ">> Cari Rekord ke- : "
      recordSearch = Squilliam::read_input.to_f

      print ">> Nama Tabel : "
      tableSearch = Squilliam::read_input

      puts "Output:"
      res = 0
      tables.each do |item|
          if item[:title] === tableSearch
              break
          end
          res+=1
      end
      
      bfr = (dict[:b]/Float(tables[res][:r])).floor
      fanout = (dict[:b]/Float(tables[res][:v]+dict[:p])).floor
      withIndex = (recordSearch/fanout).ceil
      withoutIndex = (recordSearch/bfr).ceil

      puts '>> Menggunakan indeks, jumlah blok yang diakses : ' + withIndex.to_s + ' blok'
      puts '>> Tanpa indeks, jumlah blok yang diakses : ' + withIndex.to_s + ' blok' 
    end
  end
end
