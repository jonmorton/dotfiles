export BROWSER='xdg-open'

MAINT_XFS_DISK="/dev/disk/by-uuid/792dbfd5-315a-4279-9785-ba8261cc91b1"
MAINT_MAX_FRAGMENTATION=5.00
MAINT_REMOVE_FILES=(
    "$HOME/.dbus"
    "$HOME/.esd_auth"
    "$HOME/.idlerc"
    "$HOME/.cache/.nv"
    "$HOME/tmp"/*
    "$HOME/.npm"
    "$HOME/.java"
    "$HOME/.viminfo"
    "$HOME/.python_history"
    "$HOME/.cache"/event-sound-cache*
    "$HOME/.cache/fsh"
)

remove_unwanted_files() {
    for f in $MAINT_REMOVE_FILES; do
        if [[ -f "$f" || -d "$f" ]]; then
            echo " - $f"
            rm -rf $f
        fi
    done

}

arch_maintenance() {
    echo "** System Maintenance"

    echo "Updating archlinux packages..."
    yay -Syyu

    # echo "Cleaning arch package stuff..."
    # yay -Yc
    # sudo paccache -r

    local frag=$(sudo xfs_db -c frag -r "$MAINT_XFS_DISK" | head -1 | cut -d ' ' -f 7 | sed 's/%//g')
    if (( $frag > $MAINT_MAX_FRAGMENTATION )); then
        echo -n "Disk fragmentation is greater than max ($MAINT_MAX_FRAGMENTATION%), performing defrag..."
        sudo xdb_fsr "$MAINT_XFS_DISK" || {
            echo "Defrag failed. Exiting..."
            exit 1
        }
        echo "Done."
    fi

    echo -n "Remove uwanted and temporary files..."
    remove_unwanted_files()
    echo "Done."
}