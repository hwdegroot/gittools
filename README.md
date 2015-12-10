## Scope

These scripts can be used to run git commands over multiple repo's. When you have cross repo branches and you want to check out branches simultaneous.

## Usage

Either have a `.reporc` in the root folder of the gittools where git repo directories are listed (see the `.reporc.example`) or run commands with `--repository=<file|relative/path/to/repodir>`.

## Install

    $ git clone git@github.com:hwdegroot/gittools.git

Add the following part to your `.bashrc` or `.bash_profile`

    if [ -f <gittoolslocation>/.gittoolsrc ]; then
        export GITTOOLS="<gittoolslocation>"
        source $GITTOOLS/.gittoolsrc
    fi

## Usage

The tools will allow you to define a file with locations of checked out git repo's. The tools will default look to `<gittoolslocation>/.reporc`

The tools will expose the following aliases: 

    * gprune
    * gfetch
    * gclean-branches
    * gcheckout
    * gdiff
    * gpull
    * greset
    * grevert
    * gstatus

type `command --help` to see for more help.