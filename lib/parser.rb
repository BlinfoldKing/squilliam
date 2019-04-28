module Squilliam
  class Parser
    def initialize input
      @raw = input.upcase
    end

    public def parse
      if @raw[-1] != ";"
        return { error: "Missing Semicolon Delimiter" }
      end

      @raw = @raw.tr ";", ""
      @raw = @raw.tr ",", ""
      query = @raw.split

      if query[0] != "SELECT"
        return { error: "Missing Valid Statement" }
      end

      columns = []
      from_offset = 0
      for i in 1..query.length-1
        break if query[i] == "FROM"
        columns.push query[i]
        from_offset = i
      end
      from_offset += 1

      if query[from_offset] != "FROM"
        return { error: "Missing FROM Statement" }
      end

      if from_offset >= query.length
        return { error: "Missing TABLE Statement" }
      end

      table = query[from_offset + 1]
      current_offset = from_offset + 2

      join = []

      if query[current_offset] == "JOIN"
        if current_offset >= query.length
          return { error: "Missing TABLE Statement"}
        end
        join.push query[current_offset + 1]
        current_offset += 2
      end

      if query[current_offset] == "JOIN"
        if current_offset >= query.length
          return { error: "Missing TABLE Statement"}
        end
        join.push query[current_offset + 1]
        current_offset += 2
      end

      where = ""
      if query[current_offset] == "WHERE"
        if current_offset >= query.length
          return { error: "Missing TABLE Statement"}
        end

        for i in current_offset+1..query.length - 1
          where.concat query[i]
          where.concat " "
        end
        current_offset += 2
      end

      return {
        columns: columns,
        table: table,
        join: join,
        where: where
      }

    end
  end
end
