#!/bin/bash

INSTALLER_DIR="$(chezmoi source-path)/installers"

installer_order() {
    ls "$INSTALLER_DIR" | while read INSTALLER; do
        # include a self-edge to ensure all installers are listed
        echo "$INSTALLER $INSTALLER"

        DEPENDENCIES="$(sed -ne 's/#.*depends: //p' "$INSTALLER_DIR/$INSTALLER")"
        for DEPENDENCY in $DEPENDENCIES; do
            # print dependency first because of the direction of the tsort
            echo "$DEPENDENCY $INSTALLER"
        done
    done | tsort
}

for INSTALLER in $(installer_order); do
    if [ -x "$INSTALLER_DIR/$INSTALLER" ]; then
        echo "Running installer: $INSTALLER"
        "$INSTALLER_DIR/$INSTALLER"
    fi
done
