require 'test/unit'
require 'makec'

class MakeCTest < Test::Unit::TestCase
  def test_colorize_lines
    MakeC::Colorizer.puts_with_color("error: This should be RED")
    MakeC::Colorizer.puts_with_color("warning: This should be YELLOW")
    MakeC::Colorizer.puts_with_color("This should be GREEN")
    MakeC::Colorizer.puts_with_color("in function this should be BOLD")
  end
end
