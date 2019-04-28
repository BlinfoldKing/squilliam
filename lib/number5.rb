require_relative 'helper';

module Squilliam
  class Number5
    def self.run!
      File.open "sharedpool.txt", "r" do |f|
        f.each_line do |line|
          puts line
        end
      end
    end
  end
end
