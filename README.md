## Install

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