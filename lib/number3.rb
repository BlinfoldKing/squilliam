require_relative 'helper';

# Calculate block by record (with index) = ceil(n/Fanout Ratio)+1
# Calculate block by record (without index) = ceil(n/BFr)

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
          if item[:title].casecmp?(tableSearch)
              break
          end
          if res < tables.size-1
            res+=1
          end
      end
      
      bfr = (dict[:b]/Float(tables[res][:r])).floor
      fanout = (dict[:b]/Float(tables[res][:v]+dict[:p])).floor
      withIndex = (recordSearch/Float(fanout)).ceil + 1
      withoutIndex = (recordSearch/Float(bfr)).ceil

      puts '>> Menggunakan indeks, jumlah blok yang diakses : ' + withIndex.to_s + ' blok'
      puts '>> Tanpa indeks, jumlah blok yang diakses : ' + withoutIndex.to_s + ' blok'
      puts
    end
  end
end
