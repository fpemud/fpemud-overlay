#!/bin/sh

create_link_dir ()
{
    # get params
    srcdir=${1:?} ; shift                       # only accept absolute path without trailing slash
    dstdir=${1:?} ; shift                       # same as above

    # do the job
    SAVEIFS=$IFS
    IFS=$'\n'
    for srcf in `find "$srcdir" -print`
    do
        # get inner filename
        f=${srcf:((${#srcdir}+1))}
        if [ "$f" == "" ] ; then continue ; fi

        # do the job
        if [[ -d "$srcf" && ! -L "$srcf" ]] ; then
            # create directory structure
            mkdir -p "$dstdir/$f"
        else
            # create softlink
            ln -s -t `dirname "$dstdir/$f"` $srcf
        fi
    done
    IFS=$SAVEIFS
}

# Variables
GAMEDIR=                # fill by ebuild
DATADIR=                # fill by ebuild
EXEC=                   # fill by ebuild

# Make data directory
if [ ! -e "${DATADIR}" ] ; then
    mkdir -p "${DATADIR}"
    create_link_dir "${GAMEDIR}" "${DATADIR}"
    cp --remove-destination "${GAMEDIR}"/*.sh "${DATADIR}"
fi

# run the game
cd "${DATADIR}"
./${EXEC} "$@"
