Gem::Specification.new do |s|
  s.name = "mesa_cli"
  s.version = "0.1.7"
  s.author = "William Wolf"
  s.date = %q{2018-04-06}
  s.description = "MESA CLI is a command-line interface for doing several tasks with Modules for Experiments in Stellar Astrophysics (MESA; mesa.sourceforge.net). This package includes one executable, `mesa`. Actions are performed by entering `mesa` followed by various subcommands. A list of available subcommands can be displayed by entering mesa help Any individual subcommand is documented by typing `mesa help` followed by the name of the subcommand, for instance, mesa help new will give information about what the `new` command does. For detailed instructions, see the readme on the github page at https://github.com/wmwolf/mesa_cli"
  s.summary = "Command line tools for manipulating MESA."
  s.email = "wmwolf@asu.edu"
  s.files = "bin/mesa"
  s.homepage = "http://wmwolf.github.io/mesa_cli/"
  s.add_dependency('mesa_script', '~> 0.1.4')
  s.add_dependency('thor', '~> 0.19')
  s.bindir = 'bin'
  s.executables = ['mesa']
  s.license = 'MIT'
  s.required_ruby_version = '>= 1.8.6'
end

