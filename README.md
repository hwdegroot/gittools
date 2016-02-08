## Scope

These scripts can be used to run git commands over multiple repos. When you have cross repo branches and you want to check out branches simultaneous.

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
  * `gstatus`
  * `ginfo`

To have autocompletion

    $ [sudo] cp <gittools dir>/autocompletion/* /etc/bash_completion.d/

And make sure autocompletion is enabled in `~/.bashrc`. Look for the lines:

    if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
        . /etc/bash_completion
    fi

## Usage

The tools will allow you to define a file with locations of checked out git repos. The tools will default look to `<gittoolslocation>/.reporc`

The tools will expose the following aliases: 

  * `gprune`
  * `gfetch`
  * `gclean-branches`
  * `gcheckout`
  * `gdiff`
  * `gpull`
  * `greset`
  * `gstatus`
  * `ginfo`

type `command --help` to see for more help.

## Environment variables
Set the following 

`$PRUNE_REMOTE=1`: Always prune remote origin after a checkout. Same as `gcheckout [...] --prune-remote`

`$PRE_FETCH=1`: Always fetch before checking out. Same as `gcheckout [...] --pre-fetch`

`$POST_PULL=1`: Always pull after checking out. Same as `gcheckout [...] --post-pull`

`$DEFAULT_BRANCH=branch_name`: Checkout this branch if gcheckout is called without a branch (usually this will be `master`)

__NOTE__: if you are using `.reporc` files, make sure the repository directories are relative to the file, or just abs paths.