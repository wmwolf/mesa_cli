mesa_cli
========

Command line tools for use with open source MESA stellar evolution code.

I don't think this tool is done yet, but I wanted to get it out there. So far
requires ruby, MesaScript, thor, and a working mesa directory accessed by
`$MESA_DIR`.

## Installation ##

### Rubygems Installation

Enter

    gem install mesa_cli

or if that doesn't work, enter

    sudo gem install mesa_cli

into your terminal. You should be done now!

### Manual Installation

If, for some reason, the rubygems installation doesn't work, you may clone this
repository and install the single file `mesa` (located in `mesa_cli/bin/mesa`)
as detailed below.

1. Make sure you have Ruby 1.8.7 or higher (1.9.3 recommended)
2. Install [mesascript](http://wmwolf.github.io/MesaScript/).
3. Install the Thor gem via

    sudo gem install thor

4. Place `mesa` file in your path


## Usage

To get quick information, type `mesa help` to list the commands and see what
they do. For detailed information on a particular command, type `mesa help
command` to learn about an individual command (replacing the word "command" 
with the actual subcommand name). Brief summaries of commands are below.

### default

To use, just type

    mesa default NAMELIST_NAME

where namelist name is the name of a MESA star namelist, like `star_job`,
`controls`, or `pgstar`.

This command will open the proper defaults file for the corresponding namelist
using whatever editor your system has set in the `EDITOR` variable. For
instance,

    mesa default star_job

will open `$MESA_DIR/star/defaults/star_job.defaults` in vim or whatever default editor you've set up.

### install

To use, just type

    mesa install VERSION_NUMBER [DIR_NAME] --shell=MYSHELL

This will do a fresh checkout of mesa (version number given by VERSION_NUMBER) 
into a directory (named DIR_NAME, default is mesa-rXXXX, where XXXX is the 
version number). After the checkout, mesa will install, and your login scripts 
will be updated to point MESA_DIR to this new installation directory.

By default, the shell is assumed to be bash, so `~/.bash_profile` and 
`~/.bashrc` will be checked for instances of `MESA_DIR=` in these files, which
are then updated to point to the new installation path. If no such assignments 
are found, one will be added to `~/.bash_profile` (if that file does not 
exist, it will be added to `~/.bashrc`, if it exists). There is a `--shell=` 
option, but it is currently useless since there is only one shell option.

Currently there is no support for the C shell, but this will be an feature in a future version. For a basic installation with no mucking around of shell scripts, add the `--basic` or `-b` flag.

Some examples:

    mesa install 9999

will download and install mesa revision 9999 into a directory named
`mesa-r9999` in the current directory. It will then try to find the files
`~/.bash_profile` and `~/.bashrc`. If it finds them, it will first try to
update any lines conatining `MESA_DIR=` to point them to the new,
fully-qualified path to `mesa-r9999`. If no such lines are added, it will add
the appropriate line (`export MESA_DIR=/PATH/TO/mesa-r9999`) at the end of one
of those scripts, preferring `~/.bash_profile`.

    mesa install $HOME/mesa_installations/my_latest_mesa 9999

will download and install mesa revision 9999 into the directory
`$HOME/mesa_installations/my_latest_mesa`. Then it will set `MESA_DIR` in 
login scripts as in the previous example.

    mesa install 9999 -b

will download and install mesa revision 9999 into a directory named
`mesa-r9999` in the current directory. It will not attempt to change login
scripts.

    mesa install $HOME/mesa_installations/my_latest_mesa 9999 -b

will download and install mesa revision 9999 into the directory
`$HOME/mesa_installations/my_latest_mesa`. It will not attempt to change login
scripts.

### new

To use, just type 

    mesa new DIR_NAME

where `DIR_NAME` is the name of a new MESA work directory.

This makes a copy of `$MESA_DIR/star/work` into a directory with the name
chosen. With no name (i.e. just typing `mesa new`), the directory will just be
called work. The `inlist_project` will be renamed to `inlist_DIR_NAME`. If
MesaScript is available, the main `inlist` file will be pointed to the newly-
renamed `inlist_project`, and a MesaScript version of the new `inlist_project`
will be made that compiles to `inlist_project`.

The `-s` or `--simple` option will just copy the work directory and rename the
directory only. No renaming of inlists or creation of MesaScript files will be
done.

The `-p` or `--pgstar` option will also point the main `inlist` file to the
newly-named `inlist_project` file for the `pgstar` namelist instead of the
default `inlist_pgstar`.

### point

To use, just type

    mesa point INLIST_TO_POINT_TO

where `INLIST_TO_POINT_TO` is the name of an inlist that you would like your local `inlist` file to point to. Currently this can only allow you to point to one inlist. By default, this will not point to the new inlist for the `pgstar` namelist, but it will for both of the `star_job` and `controls` namelists.

The `-p` or `--pgstar` option will also point the main `inlist` file to the
`INLIST_TO_POINT_TO` file for the `pgstar` namelist.

### test

To use, just type

    mesa test TEST_CASE DIR_NAME

where `TEST_CASE` is the name of a test case in `$MESA_DIR/star/test_suite` and `DIR_NAME` is the name of a directory to be created that will contain a copy of the proper test suite case.

The second argument is optional, and if omitted, the new directory will have 
the same name as the original test suite case. If neither argument is given, a
list of every file in `$MESA_DIR/star/test_suite` is output. The listing
behavior can also be forced by adding the `-l` or `--list` option to the call.

Work directories made in this way are "de-test-suited" in that calls back to
`inlist_test_suite` are deleted along with any other attempts to change the value of `mesa_dir`. All local path definitions (ones using `../../` or the
like) will be made fully qualified. For example, `../../../` will be turned
into `$MESA_DIR/`. Thus, references to other inlists, like 
`inlist_massive_defaults` or models, like those found in
`$MESA_DIR/data/star_data`, should remain intact. IF THESE EXTERNAL REFERENCES
CONTAIN LOCAL PATHS, THINGS WILL BREAK. The only inlist that is strictly barred
from this process is `inlist_test_suite` which currently only serves to set
the `mesa_dir` via a local path, so references to this inlist are always 
deleted.

### version

To use, just type

    mesa version

This will just print out the version number of mesa that is currently installed in your MESA_DIR.














