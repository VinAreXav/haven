{
  description = "Oomox theme build env!";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }: {
    devShells.x86_64-linux.default =
      let pkgs = import nixpkgs { system = "x86_64-linux"; };
      in pkgs.mkShell {
        buildInputs = [
          (pkgs.gdk-pixbuf.overrideAttrs (old: {
            propagatedBuildInputs = old.propagatedBuildInputs ++ [ pkgs.librsvg ];
          }))
          pkgs.glib
          pkgs.gtk3
          pkgs.sassc
          pkgs.bc
          pkgs.gnumake
          pkgs.pkg-config
          pkgs.rubyPackages.glib2
          pkgs.gsettings-desktop-schemas
        ];
      };
  };
}
