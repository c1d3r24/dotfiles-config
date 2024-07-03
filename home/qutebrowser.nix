{ config, pkgs, ... }:

let
  quickmarksFile = "/mnt/Files/Tech/Linux/quickmarks";
  quickmarksContent = builtins.readFile quickmarksFile;
in
{
  home.file.".config/qutebrowser/config.py".text = ''
    config.load_autoconfig()
    config.set("colors.webpage.darkmode.enabled", True)

    c.content.blocking.method = 'adblock'
    c.content.blocking.adblock.lists = [
        "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/annoyances.txt",
        "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/badlists.txt",
        "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/badware.txt",
        "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters-2020.txt",
        "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters-2021.txt",
        "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters.txt",
        "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/privacy.txt",
        "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/resource-abuse.txt",
        "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/thirdparties/pgl.yoyo.org/as/serverlist",
        "https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling/hosts",
        "https://raw.githubusercontent.com/AdAway/adaway.github.io/master/hosts.txt",
        "https://fanboy.co.nz/fanboy-problematic-sites.txt",
        "https://easylist.to/easylist/easylist.txt",
        "https://raw.githubusercontent.com/bogachenko/fuckfuckadblock/master/fuckfuckadblock.txt"
    ]
    c.content.blocking.enabled = True

    c.content.cookies.accept = 'no-3rdparty'
  '';

  home.file.".config/qutebrowser/quickmarks".text = quickmarksContent;
}
