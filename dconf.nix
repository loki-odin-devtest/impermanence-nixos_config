# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {
    "ca/desrt/dconf-editor" = {
      saved-pathbar-path = "/";
      saved-view = "/";
      window-height = 500;
      window-is-maximized = false;
      window-width = 540;
    };

    "com/mattjakeman/ExtensionManager" = {
      last-used-version = "0.4.2";
    };

    "org/gnome/control-center" = {
      last-panel = "multitasking";
      window-state = mkTuple [ 980 640 ];
    };

    "org/gnome/desktop/app-folders" = {
      folder-children = [ "Utilities" "YaST" "066e4466-05f3-42e3-93d4-19a0c2efa3cf" "368263ed-f8e7-4c71-894d-cd1bba9203f1" ];
    };

    "org/gnome/desktop/app-folders/folders/066e4466-05f3-42e3-93d4-19a0c2efa3cf" = {
      apps = [ "ca.desrt.dconf-editor.desktop" "obsidian.desktop" "com.mattjakeman.ExtensionManager.desktop" "org.gnome.Extensions.desktop" "btop.desktop" "com.github.hluk.copyq.desktop" "nnn.desktop" "stacer.desktop" ];
      name = "Useful";
      translate = false;
    };

    "org/gnome/desktop/app-folders/folders/368263ed-f8e7-4c71-894d-cd1bba9203f1" = {
      apps = [ "org.gnome.Calendar.desktop" "org.gnome.Contacts.desktop" "simple-scan.desktop" "org.gnome.clocks.desktop" "org.gnome.Calculator.desktop" "nixos-manual.desktop" "yelp.desktop" ];
      name = "TiddlyBits";
      translate = false;
    };

    "org/gnome/desktop/app-folders/folders/Utilities" = {
      apps = [ "gnome-abrt.desktop" "gnome-system-log.desktop" "nm-connection-editor.desktop" "org.gnome.baobab.desktop" "org.gnome.Connections.desktop" "org.gnome.DejaDup.desktop" "org.gnome.Dictionary.desktop" "org.gnome.DiskUtility.desktop" "org.gnome.eog.desktop" "org.gnome.Evince.desktop" "org.gnome.FileRoller.desktop" "org.gnome.fonts.desktop" "org.gnome.seahorse.Application.desktop" "org.gnome.tweaks.desktop" "org.gnome.Usage.desktop" "vinagre.desktop" ];
      categories = [ "X-GNOME-Utilities" ];
      name = "X-GNOME-Utilities.directory";
      translate = true;
    };

    "org/gnome/desktop/app-folders/folders/YaST" = {
      categories = [ "X-SuSE-YaST" ];
      name = "suse-yast.directory";
      translate = true;
    };

    "org/gnome/desktop/background" = {
      picture-uri = "file:///home/alternex/Pictures/Wallpapers/Gnome_G018_HD_NoLogo.png";
    };

    "org/gnome/desktop/input-sources" = {
      sources = [ (mkTuple [ "xkb" "us" ]) ];
      xkb-options = [ "terminate:ctrl_alt_bksp" ];
    };

    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      font-antialiasing = "grayscale";
      font-hinting = "slight";
      gtk-theme = "Shades-of-purple";
      icon-theme = "Adwaita";
    };

    "org/gnome/desktop/notifications" = {
      application-children = [ "firefox" "org-gnome-fileroller" "org-gnome-nautilus" ];
    };

    "org/gnome/desktop/notifications/application/firefox" = {
      application-id = "firefox.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-fileroller" = {
      application-id = "org.gnome.FileRoller.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-nautilus" = {
      application-id = "org.gnome.Nautilus.desktop";
    };

    "org/gnome/desktop/session" = {
      idle-delay = mkUint32 0;
    };

    "org/gnome/desktop/wm/preferences" = {
      button-layout = "close,minimize,maximize:appmenu";
    };

    "org/gnome/evolution-data-server" = {
      migrated = true;
    };

    "org/gnome/file-roller/dialogs/extract" = {
      recreate-folders = true;
      skip-newer = false;
    };

    "org/gnome/file-roller/listing" = {
      list-mode = "as-folder";
      name-column-width = 250;
      show-path = false;
      sort-method = "name";
      sort-type = "ascending";
    };

    "org/gnome/file-roller/ui" = {
      sidebar-width = 200;
      window-height = 480;
      window-width = 600;
    };

    "org/gnome/gnome-system-monitor" = {
      maximized = false;
      network-total-in-bits = false;
      show-dependencies = false;
      show-whose-processes = "user";
      window-state = mkTuple [ 1077 500 ];
    };

    "org/gnome/gnome-system-monitor/disktreenew" = {
      col-6-visible = true;
      col-6-width = 0;
    };

    "org/gnome/gnome-system-monitor/memmapstree" = {
      sort-col = 0;
      sort-order = 0;
    };

    "org/gnome/nautilus/preferences" = {
      default-folder-viewer = "icon-view";
      migrated-gtk-settings = true;
      search-filter-time-type = "last_modified";
    };

    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = false;
      night-light-schedule-automatic = false;
      night-light-schedule-from = 1.0;
      night-light-schedule-to = 23.0;
      night-light-temperature = mkUint32 1970;
    };

    "org/gnome/settings-daemon/plugins/power" = {
      sleep-inactive-ac-type = "nothing";
    };

    "org/gnome/shell" = {
      app-picker-layout = "[{'368263ed-f8e7-4c71-894d-cd1bba9203f1': <{'position': <0>}>, '066e4466-05f3-42e3-93d4-19a0c2efa3cf': <{'position': <1>}>, 'org.gnome.Settings.desktop': <{'position': <2>}>, 'gnome-system-monitor.desktop': <{'position': <3>}>, 'Utilities': <{'position': <4>}>, 'xterm.desktop': <{'position': <5>}>}]";
      enabled-extensions = [ "dash-to-dock@micxgx.gmail.com" "user-theme@gnome-shell-extensions.gcampax.github.com" ];
      favorite-apps = [ "firefox.desktop" "org.gnome.Terminal.desktop" "org.gnome.Nautilus.desktop" "code.desktop" "org.gnome.TextEditor.desktop" ];
      welcome-dialog-last-shown-version = "44.2";
    };

    "org/gnome/shell/extensions/dash-to-dock" = {
      background-color = "rgb(107,64,191)";
      background-opacity = 0.88;
      custom-background-color = true;
      dash-max-icon-size = 68;
      disable-overview-on-startup = true;
      dock-fixed = true;
      dock-position = "BOTTOM";
      height-fraction = 0.9;
      preferred-monitor = -2;
      preferred-monitor-by-connector = "Virtual-1";
      show-trash = false;
      transparency-mode = "FIXED";
    };

    "org/gnome/shell/extensions/user-theme" = {
      name = "Shades-of-purple";
    };

    "org/gnome/terminal/legacy" = {
      theme-variant = "dark";
    };

    "org/gnome/terminal/legacy/profiles:" = {
      default = "bdd80946-294d-4774-83fd-9d10cf82ab05";
      list = [ "b1dcc9dd-5262-4d8d-a863-c897e6d979b9" "0ee097c4-b546-42aa-9ec4-250cb50755b3" "bdd80946-294d-4774-83fd-9d10cf82ab05" "2760431b-eee0-4884-bffe-f97c8ccfb01c" "58047096-b657-4fde-b303-eff1b93f16d6" ];
    };

    "org/gnome/terminal/legacy/profiles:/:0ee097c4-b546-42aa-9ec4-250cb50755b3" = {
      visible-name = "placeholder";
    };

    "org/gnome/terminal/legacy/profiles:/:2760431b-eee0-4884-bffe-f97c8ccfb01c" = {
      allow-bold = true;
      background-color = "#28282C2C3434";
      bold-color = "#C3C3C7C7D1D1";
      bold-color-same-as-fg = true;
      cursor-background-color = "#C3C3C7C7D1D1";
      cursor-colors-set = true;
      cursor-foreground-color = "#28282C2C3434";
      foreground-color = "#C3C3C7C7D1D1";
      palette = [ "#28282C2C3434" "#EDED25254E4E" "#7171F7F79F9F" "#F9F9DCDC5C5C" "#7C7CB7B7FFFF" "#C7C74D4DEDED" "#0000C1C1E4E4" "#DCDCDFDFE4E4" "#28282C2C3434" "#EDED25254E4E" "#7171F7F79F9F" "#F9F9DCDC5C5C" "#7C7CB7B7FFFF" "#C7C74D4DEDED" "#0000C1C1E4E4" "#DCDCDFDFE4E4" ];
      use-theme-background = false;
      use-theme-colors = false;
      use-theme-transparency = false;
      visible-name = "Sweet Eliverlara";
    };

    "org/gnome/terminal/legacy/profiles:/:58047096-b657-4fde-b303-eff1b93f16d6" = {
      allow-bold = true;
      background-color = "#222222223535";
      bold-color = "#FFFFFFFFFFFF";
      bold-color-same-as-fg = true;
      cursor-background-color = "#FFFFFFFFFFFF";
      cursor-colors-set = true;
      cursor-foreground-color = "#222222223535";
      foreground-color = "#FFFFFFFFFFFF";
      palette = [ "#3F3F3F3F5454" "#F6F600005555" "#0606C9C99393" "#97970000BEBE" "#F6F691915454" "#ECEC8989CBCB" "#6060ADADECEC" "#ABABB2B2BFBF" "#95959D9DCBCB" "#F6F600005555" "#0606C9C99393" "#97970000BEBE" "#F6F691915454" "#ECEC8989CBCB" "#0000DDDDEDED" "#FFFFFFFFFFFF" ];
      use-theme-background = false;
      use-theme-colors = false;
      use-theme-transparency = false;
      visible-name = "Sweet Terminal";
    };

    "org/gnome/terminal/legacy/profiles:/:bdd80946-294d-4774-83fd-9d10cf82ab05" = {
      allow-bold = true;
      background-color = "#424239395D5D";
      bold-color = "#C2C2FFFFDFDF";
      bold-color-same-as-fg = true;
      cursor-background-color = "#FFFFB8B8D1D1";
      cursor-colors-set = true;
      cursor-foreground-color = "#424239395D5D";
      foreground-color = "#C2C2FFFFDFDF";
      palette = [ "#424239395D5D" "#A8A875757B7B" "#FFFF85857F7F" "#E6E6C0C00000" "#AEAE8181FFFF" "#717167679999" "#C2C2FFFFDFDF" "#F8F8F8F8F2F2" "#757550507B7B" "#FFFFB8B8D1D1" "#F1F156568E8E" "#D5D5A4A42525" "#C5C5A3A3FFFF" "#80807777A8A8" "#C2C2FFFFFFFF" "#F8F8F8F8F0F0" ];
      use-theme-background = false;
      use-theme-colors = false;
      use-theme-transparency = false;
      visible-name = "Fairy Floss Dark";
    };

    "org/gnome/tweaks" = {
      show-extensions-notice = false;
    };

    "org/gtk/gtk4/settings/color-chooser" = {
      custom-colors = [ (mkTuple [ 0.4200000762939453 0.2499999850988388 ]) ];
      selected-color = mkTuple [ true 0.4200000762939453 ];
    };

    "org/gtk/gtk4/settings/file-chooser" = {
      show-hidden = true;
    };

    "org/gtk/settings/file-chooser" = {
      date-format = "regular";
      location-mode = "path-bar";
      show-hidden = true;
      show-size-column = true;
      show-type-column = true;
      sidebar-width = 187;
      sort-column = "name";
      sort-directories-first = false;
      sort-order = "ascending";
      type-format = "category";
      window-position = mkTuple [ 30 26 ];
      window-size = mkTuple [ 1203 889 ];
    };

  };
}
