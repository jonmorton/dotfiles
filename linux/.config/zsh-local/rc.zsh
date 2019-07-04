export BROWSER='xdg-open'

export PATH="$PATH:/home/jon/.poetry/bin"

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
    "$HOME/.cache"/event-sound-cache*
    "$HOME/.cache/fsh"
    "$HOME/.pylint.d"
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

    echo "Updating zsh packages"
    zplug update

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

docker_clean() {
	docker rm $(docker ps -a -q)
	docker rmi $(docker images -q) -f
	docker volume rm $(docker volume ls -q) -f
}

[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh
