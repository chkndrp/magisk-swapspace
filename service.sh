#!/system/bin/sh

#  This module allows for creating a persistent swap space on android 
#  Copyright (C) 2025 chkndrp
#
#  This program is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 3 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program.  If not, see <https://www.gnu.org/licenses/>.

# Wait until /data is decrypted
while [[ "$(getprop sys.boot_completed)" != "1" ]]; 
    do sleep 5
done

# Import common functions from file
. "$MODPATH/common.sh"

SWAPPINESS_PROP="$(readProp SWAPPINESS)"
ENABLE_SWAP_PROP="$(readProp ENABLE-SWAP)"

# Sets the Swappiness value if configured
if [[ -n $SWAPPINESS_PROP ]];
  then setKernelTune "$SWAPPINESS_SYSCTL_ENTRY" "$SWAPPINESS_PROP"
fi

# If swapspace was configured, swap-on boot
if [[ $ENABLE_SWAP_PROP == "true" ]];
  then
    PRIORITY="$(readProp SWAP-PRIORITY)"

    # If priority parameter was specified, use it when swapping-on
    if [[ -n $PRIORITY && $PRIORITY != "false" ]];
        then
          PRIORITY="-p $PRIORITY"
        else
          unset PRIORITY
    fi

    # shellcheck disable=SC2086
    toybox swapon $PRIORITY $SWAPFILE
fi
