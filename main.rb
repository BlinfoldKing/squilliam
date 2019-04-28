require_relative 'lib/parser'

module Squilliam
  def self.read_input
    return gets.chomp
  end

  def self.run!
    loop do
      puts "1. Tampilkan BFR dan Fanout Ratio Setiap Tabel"
      puts "2. Tampilkan Total Blok Data + Blok Index Setiap Tabel"
      puts "3. Tampilkan Jumlah Blok yang diakses untuk pencarian Record"
      puts "4. Tampilkan QEP dan Cost"
      puts "5. Tampilkan Isi File Shared Pool"
      print "=>"
      input = read_input
      break unless input != "6"
      puts ""

      case input.to_i
      when 1
        parser = Parser.new read_input
        puts parser.parse
      when 2..5
        puts "hello world"
      else
        puts "Error: Invalid Input"
      end
    end
  end
end

Squilliam::run!
