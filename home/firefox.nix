{ inputs, pkgs, config, ... }: 

let
  isUnstable = pkgs == inputs.nixpkgs-unstable.legacyPackages.${pkgs.system};
  bookmarksFile = /mnt/Files/Tech/Linux/bookmarks.nix;
in
{
  programs.firefox = {
    enable = true;
    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
      DisablePocket = true;
      DisableFirefoxAccounts = true;
      DisableAccounts = true;
      DisableFirefoxScreenshots = true;
      OverrideFirstRunPage = "";
      OverridePostUpdatePage = "";
      DontCheckDefaultBrowser = true;
      DisplayBookmarksToolbar = "always"; # alternatives: "never", "newtab"
    };
    profiles = {
      default = {
        extensions = with (if isUnstable then inputs.firefox-addons-unstable.pacakges.${pkgs.system} else inputs.firefox-addons-stable.packages.${pkgs.system}); [
          ublock-origin
          bitwarden
          darkreader
        ];
        bookmarks = import bookmarksFile;
        search = {
          default = "DuckDuckGo";
          engines = {
            DuckDuckGo = {
              name = "DuckDuckGo";
              url = "https://duckduckgo.com/?q={searchTerms}";
            };
          };
        };
        settings = {
          "browser.startup.homepage" = "https://start.duckduckgo.com";
          "dom.security.https_only_mode" = true;
          "privacy.trackingprotection.enabled" = true;
          "signon.rememberSignons" = false;
          "browser.disableResetPrompt" = true;
          "browser.download.panel.shown" = true;
          "browser.download.useDownloadDir" = false;
          "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
          "browser.shell.checkDefaultBrowser" = false;
          "browser.shell.defaultBrowserCheckCount" = 1;
          "browser.uiCustomization.state" = ''{
            "placements": {
              "widget-overflow-fixed-list": [],
              "nav-bar": [
                "back-button",
                "forward-button",
                "stop-reload-button",
                "home-button",
                "urlbar-container",
                "downloads-button",
                "library-button",
                "ublock0_raymondhill_net-browser-action",
                "_testpilot-containers-browser-action"
              ],
              "toolbar-menubar": ["menubar-items"],
              "TabsToolbar": ["tabbrowser-tabs", "new-tab-button", "alltabs-button"],
              "PersonalToolbar": ["personal-bookmarks"]
            },
            "seen": ["save-to-pocket-button", "developer-button", "ublock0_raymondhill_net-browser-action", "_testpilot-containers-browser-action"],
            "dirtyAreaCache": ["nav-bar", "PersonalToolbar", "toolbar-menubar", "TabsToolbar", "widget-overflow-fixed-list"],
            "currentVersion": 18,
            "newElementCount": 4
          }
          '';
        };
      };
    };
  };
}
