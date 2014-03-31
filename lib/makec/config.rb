require 'debugger'
module MakeC
  module Config
    extend self
    
    def configure(&block)
      instance_eval(&block)
    end
    
    def categories
      @categories ||= Hash.new
    end
    
    def category(name)
      categories[name] ||= Category.new(name)
      yield categories[name] if block_given?
      categories[name]
    end
    
    def default
      @default ||= Category.new("default")
      yield @default if block_given?
      @default
    end
    
    def run_command
      @run_command ||= ""
      yeild @run_command if block_given
      return @run_command
    end
    
    class Category
      attr_accessor :name, :match, :foreground, :background, :hr_foreground,
                    :hr_background, :bold, :priority, :match_count
                    
      def initialize(_name, options={})
        @name = _name
        @match = ""
        @foreground = nil
        @background = nil
        @hr_foreground = nil
        @hr_background = nil
        @bold = false
        @priority = 1
        @match_count = 0
      end
    end
  end
end # module MakeC