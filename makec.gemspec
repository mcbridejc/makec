Gem::Specification.new do |s|
  s.name        = 'makec'
  s.version     = '0.1.0'
  s.date        = '2014-03-30'
  s.summary     = 'Colorize make/gcc build output'
  s.description = 'A simple wrapper for make (or other commands) that applies color to highlight errors and other warnings'
  s.authors     = ["Jeff McBride", "Gilson Motta"]
  s.email       = ["mcbridejc@gmail.com"]
  s.files       = ["bin/makec", 
                   "lib/makec.rb", 
                   "lib/makec/colorizer.rb",
                   "lib/makec/config.rb",
                   "lib/makec/default_config.rb" ]
  s.executables = ["makec"]     
  s.add_runtime_dependency 'colorize', '~> 0'
  s.homepage    = 'http://github.com/mcbridejc/makec'
  s.license     = 'MIT'
end
