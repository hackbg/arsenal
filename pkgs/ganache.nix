{appimageTools, pkgs}: pkgs.appimageTools.wrapType2 {
  name = "ganache";
  src = pkgs.fetchurl {
    url = "https://github.com/trufflesuite/ganache/releases/download/v2.5.4/ganache-2.5.4-linux-x86_64.AppImage";
    sha256 = "13wy7h2j6l1zp1fxji2q2a59wp31z2f2zgiwsrwkn9g5i088rvgm";
  };
  extraPkgs = pkgs: with pkgs; [
    libcanberra
    libcanberra-gtk2
    libcanberra-gtk3
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-dbus-proxy
  ];
}
