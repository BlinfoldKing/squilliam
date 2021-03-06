require_relative 'lib/helper'
require_relative 'lib/number1'
require_relative 'lib/number2'
require_relative 'lib/number3'
require_relative 'lib/number4'
require_relative 'lib/number5'


require_relative 'lib/parser'

module Squilliam
  def self.run!
    loop do
      puts "1. Tampilkan BFR dan Fanout Ratio Setiap Tabel"
      puts "2. Tampilkan Total Blok Data + Blok Index Setiap Tabel"
      puts "3. Tampilkan Jumlah Blok yang diakses untuk pencarian Record"
      puts "4. Tampilkan QEP dan Cost"
      puts "5. Tampilkan Isi File Shared Pool"
      puts "6. exit"
      print "Input =>"
      input = read_input
      break unless input != "6"
      puts ""

      case input.to_i
      when 1
        Number1::run!
      when 2
        Number2::run!
      when 3
        Number3::run!
      when 4
        Number4::run!
      when 5
        Number5::run!
      else
        puts "Error: Invalid Input"
      end
    end
  end
end

Squilliam::run!
