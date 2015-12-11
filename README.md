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

Change the `<gittoolslocation>` with the location where you installed the tools.

## Autocompletion

Currently available for (a subset of)
  * `gprune`
  * `gfetch`
  * `gclean-branches`
  * `gcheckout`
  * `gdiff`
  * `gpull`
  * `greset`
  * `grevert`
  * `gstatus`
  * `ginfo`

To have autocompletion

    $ [sudo] cp <gittools dir>/autocompletion/* /etc/bash_completion.d/

And make sure autocompletion is enabled in `~/.bashrc`. Look for the lines:

    if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
        . /etc/bash_completion
    fi

## Usage

The tools will allow you to define a file with locations of checked out git repo's. The tools will default look to `<gittoolslocation>/.reporc`

The tools will expose the following aliases: 

  * `gprune`
  * `gfetch`
  * `gclean-branches`
  * `gcheckout`
  * `gdiff`
  * `gpull`
  * `greset`
  * `grevert`
  * `gstatus`
  * `ginfo`

type `command --help` to see for more help.

__NOTE__: if you are using `.reporc` files, make sure the repository directories are relative to the file, or just abs paths.