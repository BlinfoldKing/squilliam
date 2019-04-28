require_relative 'helper';
require_relative 'parser';

module Squilliam
  class Number4
    def self.run!
      puts "Input Query"
      print ">>"
      query = Squilliam::read_input
      parser = Parser.new query

      dict = Squilliam::load_dictionary
      tables = dict[:tables]

      data = parser.parse

      columns = []
      for table in tables
        if table[:title] == data[:table]
          if data[:columns][0] == "*"
            columns.push table[:attributes]
          else
            columns.push data[:columns]&table[:attributes]
          end
        end

        for join in data[:join]
          if table[:title] == join
            if data[:columns][0] == "*"
              columns.push table[:attributes]
            else
              columns.push data[:columns]&table[:attributes]
            end
          end
        end
      end

      puts "Output"
      puts ">> Tabel (1) : #{data[:table]}"
      puts "   List Kolom: #{columns[0].join ','}"
      for i in 0..data[:join].length-1
        puts "   Table (#{i + 2}) : #{data[:join][i]}"
        puts "   List Kolom: #{columns[i + 1].join ','}"
      end
    end
  end
end
