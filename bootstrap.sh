. /etc/os-release

case "$NAME" in
  'Arch Linux')
    sudo pacman -Sy \
      stow \
      river kanshi foot mako waybar wireplumber ttf-hack \
      neovim \
    ;;
  *)
    echo 'error: unsupported distro!'
    exit 1
    ;;
esac

mkdir -p ~/.local/state/dotfiles

# vim: et sw=2 ts=2
