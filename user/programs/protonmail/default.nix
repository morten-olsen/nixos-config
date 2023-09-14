{ config, pkgs, ... }:

{
  home.packages = [ pkgs.protonmail-bridge ];
    systemd.user.services.protonmail-bridge = {
      Unit = {
        Description = "Protonmail Bridge";
        After = [ "network.target" ];
      };

      Service = {
        Restart = "always";
        ExecStart = "${pkgs.protonmail-bridge}/bin/protonmail-bridge --no-window --log-level ${cfg.logLevel}" + optionalString (cfg.nonInteractive) " --noninteractive";
      };

      Install = {
        WantedBy = [ "default.target" ];
      };
    };
  };
}
