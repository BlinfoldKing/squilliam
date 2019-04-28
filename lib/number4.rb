require_relative 'helper';
require_relative 'parser';

module Squilliam
  class Number4
    def self.run!
      puts "Input Query"
      print ">> "
      query = Squilliam::read_input
      parser = Parser.new query

      dict = Squilliam::load_dictionary
      tables = dict[:tables]

      data = parser.parse

      columns = {}
      for table in tables
        if table[:title] == data[:table]
          if data[:columns][0] == "*"
            columns[table[:title]] = table[:attributes]
          else
            columns[table[:title]] = data[:columns]&table[:attributes]
          end
        end

        for join in data[:join]
          if table[:title] == join
            if data[:columns][0] == "*"
              columns[table[:title]] = table[:attributes]
            else
              columns[table[:title]] = data[:columns]&table[:attributes]
            end
          end
        end
      end

      puts "Output"
      puts ">> Tabel (1) : #{data[:table]}"
      puts "   List Kolom: #{columns[data[:table]].join ','}"
      for i in 0..data[:join].length-1
        puts "   Table (#{i + 2}) : #{data[:join][i]}"
        puts "   List Kolom: #{columns[data[:join][i]].join ','}"
      end


      # get bfr
      bfr = 0
      block_count = 0
      fanout = 0
      for table in dict[:tables]
        if table[:title] == data[:table]
          bfr = (dict[:b]/table[:r]).floor
          block_count = (table[:n]/bfr).ceil
          fanout = (dict[:b] / (table[:v] + dict[:p])).floor
        end
      end

      join_count = 0
      if data[:join].length > 0
        for table in dict[:tables]
          if table[:title] == data[:join][0]
            join_bfr = (dict[:b]/table[:r]).floor
            join_count = (table[:n]/join_bfr).ceil
          end
        end
      end

      key = ["KODE_PENULIS", "NO_BUKU"]

      # generate QEP
      qep_cost = []
      qep_result = []
      for i in 1..2
        qep_col = []
        if data[:columns][0] == "*"
          qep_col = columns[data[:table]]
          for join in data[:join]
            qep_col = qep_col | columns[join]
          end
        end
        header = ">> QEP ##{i}"
        projection = "   PROJECTION #{qep_col.join ','} -- on the fly"
        extra = ""

        join = false
        if data[:join].length > 0
          extra = "     JOIN #{data[:table]}.#{data[:use]} == #{data[:join][0]}.#{data[:use]} -- BNLJ\n"
          if i == 1
            extra = extra + "   #{data[:table]}    #{data[:join][0]}"
          else
            extra = extra + "   #{data[:join][0]}    #{data[:table]}"
          end
          join = true
        elsif data[:where]
            extra = "   SELECTION #{data[:where]}"
        end

        where = data[:where].split
        is_key = ([where[0]]&key).length > 0
        key_view = ""

        cost = 0
        if join
          if i == 1
            cost = block_count * join_count + block_count
          else
            cost = join_count * block_count + join_count
          end
        else
          if i == 1
            key_view += "-- A1"
            if is_key
              cost = (block_count.to_f/2.0).ceil
              key_view += " key"
            else
              cost = block_count
            end
          else
            key_view += "-- A2"
            cost = Math.log(block_count, fanout).ceil + 1
          end
        end

        cost_view = "Cost: #{cost} block"
        qep_cost.push cost

        puts header
        qep_result.push "#{projection}\n#{extra}#{key_view}\n#{cost_view}\n"
        puts qep_result[i - 1]

      end


      if cost[1] > cost[0]
        puts "Optimal QEP : QEP #2"
      else
        puts "Optimal QEP : QEP #1"
      end
    end
  end
end
