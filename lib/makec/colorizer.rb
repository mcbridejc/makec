require 'colorize'
require_relative 'config.rb'

module MakeC

  class Colorizer
    
    def self.puts_with_color(s)
      # Get a list of category objects sorted by their priority
      cats = MakeC::Config.categories.values.sort_by {|c| c.priority}
      s.split(/\r?\n|\r/).each do |line|
        cats.each do |c|
          if(c.match.is_a? Array)
            match = c.match
          else 
            match = [c.match]
          end
          if match.any? { |m| line.downcase.include? m }
            print_with_cat(line, c)
            c.match_count += 1
            return
          end
        end
        print_with_cat(line, MakeC::Config.default)
      end
    end
    
    def self.print_with_cat(line, c)
      hr_length = [line.length, 80].min
      puts line.colorize( c.foreground ).colorize( :background => c.background )
      if(c.hr_foreground)
        puts ("-" * hr_length).colorize( c.hr_foreground ).colorize( :background => c.hr_background )
      end
    end
    
  end # class Colorizer
  
end # module MakeC