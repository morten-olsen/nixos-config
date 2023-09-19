{ config, pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    package = pkgs.wrapFirefox pkgs.firefox-unwrapped {
      extraPolicies = {
        CaptivePortal = false;
        DisableFirefoxStudies = true;
        DisablePocket = true;
        DisableTelemetry = true;
        DisableFirefoxAccounts = false;
        NoDefaultBookmarks = true;
        OfferToSaveLogins = false;
        OfferToSaveLoginsDefault = false;
        PasswordManagerEnabled = false;
        FirefoxHome = {
            Search = true;
            Pocket = false;
            Snippets = false;
            TopSites = false;
            Highlights = false;
        };
        UserMessaging = {
            ExtensionRecommendations = false;
            SkipOnboarding = true;
        };
      };
    };
    profiles = {
      default = {
        extensions = with pkgs.nur.repos.rycee.firefox-addons; [
          duckduckgo-privacy-essentials
          react-devtools
          reduxdevtools
          hoppscotch
          grammarly
          vimium
          onepassword-password-manager
        ];
      };
    };
  };
}
