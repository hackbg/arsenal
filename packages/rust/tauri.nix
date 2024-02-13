{ pkgs, ... }: {
  name = "hackbg-arsenal-tauri";
  paths = with pkgs; [
    pkg-config
    openssl
    glib
    cairo
    pango
    atk
    gdk-pixbuf
    gnome3.libsoup
    gtk3-x11
    gnome3.gtksourceview
    libappindicator-gtk3
    gnome3.webkitgtk
    clang
    llvm
  ];
}
