MakeC::Config.configure do 
  
  run_command = "make"
  
  category "error" do |c|
    c.match = ["error:", "undefined reference to"]
    c.foreground = :red
    c.background = nil
    c.hr_foreground = :white
    c.hr_background = :red
  end
  
  category "warning" do |c|
    c.match = ["warning:"]
    c.foreground = :yellow
    c.background = nil
    c.hr_foreground = nil
    c.hr_background = nil
  end
  
  category "info" do |c|
    c.match = ["in function"]
    c.bold = true
  end
  
  default do |c|
    c.foreground = :green
  end
end