makec
=====

Colorize GCC output for easy reading

## Overview

This project contains a ruby gem to colorize the output of make/gcc builds. It 
includes an executable, makec, which can be run as a wrapper to make, and will
print each line of the build output with different colors based on strings 
found in the line. By default, errors are printed red, with an underlining
horizontal rule, warnings are printed yellow, and unmatched lines are printed
in green. However, the color settings, as well as the match strings, can be
modified or extended with a configuration file in your home directory. 

## Installation

Until it is published to RubyGems, you'll have to clone the git repo and 
build the gem file yourself. 

```
   git clone https://github.com/mcbridejc/makec.git
   cd makec
   gem build makec.gemspec
   gem install makec
```

## Usage

In most cases, usage is simple. Once installed, simply run the
command `makec`, in place of `make`. The makec script will run make, passing it
any provided arguments, and will print the output with added colorization. 

Alternatively, you may create a bash alias so that makec is automatically
run in place of make: `alias make='makec'`

## Configuration

The command that is run by makec, as well as the coloring options, can be
configured by creating a file in your home directory called `.makec-config.rb`.

The following example shows the default configuration. Any of these values 
can be overridden, or you can create entirely new categories to colorize. 
The fields assigned `nil` are not necessary, and can be excluded with no 
effect. They are shown here in order to demonstrate all possible config
options. 

```
MakeC::Config.configure do 
  
  run_command = "make"
  
  # You can define any categories you want, with arbitrary names. However, 
  # the category names 'error', and 'warning' are somewhat special, as these
  # are used to provide the number of errors and warnings in the post-build 
  # summary. 
  category "error" do |c|
    c.match = ["error:", "undefined reference to"]
    c.foreground = :red
    c.background = nil
    c.hr_foreground = :white
    c.hr_background = :red
    c.priority = 1
  end
  
  category "warning" do |c|
    c.match = ["warning:"]
    c.foreground = :yellow
    c.background = nil
    c.hr_foreground = nil
    c.hr_background = nil
    c.priority = 1
  end
  
  category "info" do |c|
    c.match = ["in function"]
    c.bold = true
    c.priority = 1
  end

  # default category is applied to any lines that do not match the other
  # categories. It takes all of the same options, however, the match and 
  # priority options have no effect. 
  default do |c|
    c.foreground = :green

  end
end
```

## Origins 

This project is derived from GilCC (http://www.onlysolutionssoftware.com/gilcc/),
which was released under the MIT license by Gilson Motta. 
I've adapted it to fit my tastes, to allow easier installation as a gem, to
allow customization via config file, to print sub-process output as it is 
available rather than wait for the build to complete, and to not have to see 
colorful copyright/advertising banners every time I run make.
 
## Licensing

All code contained in this project is released under the MIT license, as 
defined in the LICENSE file. 
