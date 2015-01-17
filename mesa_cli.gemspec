Gem::Specification.new do |s|
  s.name = 'mesa_cli'
  s.version = '0.1.0'
  s.authors = ["William Wolf"]
  s.date = %q{2015-01-16}
  s.summary = 'Mesa CLI - a command line interface for simple MESA tasks.'
  s.description = <<-LONGDESC
    MESA CLI is a command-line interface for doing several tasks with Modules
    for Experiments in Stellar Astrophysics (MESA; mesa.sourceforge.net). This
    package includes one executable, `mesa`. Actions are performed by entering
    `mesa` followed by various subcommands. A list of available subcommands can
    be displayed by entering

    mesa help

    Any individual subcommand is documented by typing `mesa help` followed by
    the name of the subcommand, for instance,

    mesa help new

    will give information about what the `new` command does. For detailed
    instructions, see the readme on the github page at 

    https://github.com/wmwolf/mesa_cli
  LONGDESC
  s.email = 'wmwolf@physics.ucsb.edu'
  s.files = ['README.md']
  s.executables = ['bin/mesa']
  s.homepage = 'https://wmwolf.github.io'
  s.has_rdoc = false
  s.licenses = ['MIT']
  s.add_runtime_dependency 'thor', '>= 0.19'
  s.add_runtime_dependency 'mesa_script', '>= 0.1.2'
end