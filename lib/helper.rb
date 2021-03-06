module Squilliam
  def self.read_input
    return gets.chomp
  end

  def self.load_dictionary
    File.open "./data_dictionary.txt", "r" do |f|
      tables = []
      p = ""
      b = ""
      f.each_with_index do |line, index|
        if index == 0
          line = line.tr "#", ""
          line = line.split ";"
          p = line[0].split
          p = p[1]
          b = line[1].split
          b = b[1]
        else
          data = line.split ";"
          attributes = data[1].split ","
          for attr in attributes
            attr.upcase!
          end
          r = data[2].split[1]
          n = data[3].split[1]
          v = data[4].split[1]
          tables.push ({
                         title: data[0].upcase,
                         attributes: attributes,
                         r: r.to_i,
                         n: n.to_i,
                         v: v.to_i
                       })
        end
      end

      return { p: p.to_i, b: b.to_i, tables: tables }

    end

  end
end

