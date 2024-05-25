{
  description = "Quarto devshell";

  # Flake inputs
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  # Flake outputs
  outputs = { self, nixpkgs }:
    let
      # Systems supported
      allSystems = [
        "x86_64-linux" # 64-bit Intel/AMD Linux
        "aarch64-linux" # 64-bit ARM Linux
        "x86_64-darwin" # 64-bit Intel macOS
        "aarch64-darwin" # 64-bit ARM macOS
      ];

      # Helper to provide system-specific attributes
      forAllSystems = f: nixpkgs.lib.genAttrs allSystems (system: f {
        pkgs = import nixpkgs { inherit system; };
      });
    in
    {
      # Development environment output
      devShells = forAllSystems ({ pkgs }: {
        default =
          let
            my-python-packages = ps: with ps; [
              ipython
              ipykernel
              jupyterlab
              matplotlib
              numpy
              pandas
              pynvim
              rich
              scikitlearn
              seaborn
              xarray
            ];
          in
          pkgs.mkShell {
            # The Nix packages provided in the environment
            packages = with pkgs; [
              quarto
              # Python plus helper tools
              (python311.withPackages my-python-packages)
            ];

            # buildInputs = with pkgs; [
            #   (quarto.override {
            #     extraPythonPackages = my-python-packages;
            #   })

            shellHook = ''
              export QUARTO_PYTHON=$(which python)
            '';
          };
      });
    };
}
