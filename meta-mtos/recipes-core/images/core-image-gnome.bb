SUMMARY = "A gnome desktop image that fully supports the target device \
hardware."

IMAGE_FEATURES += "allow-empty-password allow-root-login empty-root-password package-management serial-autologin-root ssh-server-openssh weston x11"
IMAGE_INSTALL += "packagegroup-gnome-desktop packagegroup-gnome-apps gdm systemd"

LICENSE = "MIT"

inherit core-image
