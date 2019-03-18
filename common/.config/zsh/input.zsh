
bindkey -e

# Bind Shift + Tab to go to the previous menu item.
if [[ -n "${key_info[BackTab]}" ]]; then
  bindkey "${key_info[BackTab]}" reverse-menu-complete
fi
