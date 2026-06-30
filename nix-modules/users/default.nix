{
	options,
	config,
	pkgs,
	lib,
	...
}: let
	cfg = config.nixModules.users;
	getDefaultUid = name: let
		hash = builtins.hashString "md5" name;
		shortHex = builtins.substring 0 4 hash;
		decimalValue = lib.strings.hexToDec shortHex;
		uid = 10000 + (decimalValue - 20000 * (decimalValue / 20000));
	in uid;
in {
	options.nixModules.users = lib.mkOption {
		description = "User accounts for the system";
		default = {};

		type = lib.types.attrsOf (lib.types.submodule ({ name, ... }: {
			options = {
				description = lib.mkOption {
					type = lib.types.str;
					description = "The user's description";
					example = "John Doe";
				};
				sudoer = lib.mkOption {
					type = lib.types.bool;
					description = "Whether the user should be a sudoer";
					example = true;
					default = false;
				};
				linger = lib.mkOption {
					type = lib.types.bool;
					description = "Whether the user's services should be started at boot";
					example = true;
					default = false;
				};
				oldNames = lib.mkOption {
					type = lib.types.listOf lib.types.str;
					description = "Old usernames to symlink";
					default = [ ];
				};
				hashedPassword = lib.mkOption {
					type = lib.types.str;
					description = "The user's password hash";
					example = "$y$j9T$VEJtLu77FdTIbtMenY.M90$SaIAHQtSuTnRJY7OqBzFkM7fPKMOyfctVeNADa8uHO4";
				};
				shell = lib.mkOption {
					type = lib.types.shellPackage;
					description = "The user's shell";
					example = pkgs.bashInteractive;
					default = pkgs.bashInteractive;
				};
				packages = lib.mkOption {
					type = lib.types.listOf lib.types.package;
					description = "The user's packages";
					example = [ pkgs.neovim ];
					default = [ ];
				};
				home = lib.mkOption {
					type = lib.types.str;
					description = "The user's home directory";
					default = "/home/${name}";
				};
				groups = lib.mkOption {
					type = lib.types.listOf lib.types.str;
					description = "The user's groups";
					example = [ "docker" ];
					default = [ ];
				};
				uid = lib.mkOption {
					type = lib.types.ints.u16;
					description = "The user's UID";
					example = 1000;
					default = getDefaultUid name;
				};
				homeConfig = lib.mkOption {
					type = lib.types.unspecified;
					description = "The path of the user's home-manager config";
				};
			};
		}));
	};

	config = {
		users.users = lib.mapAttrs (username: userOpts: {
			isNormalUser = true;
			extraGroups = userOpts.groups
				++ (lib.optional userOpts.sudoer "wheel");

			inherit (userOpts) description hashedPassword shell packages home uid;
		}) cfg;

		systemd.tmpfiles.rules = lib.flatten (lib.mapAttrsToList (username: userOpts:
			map (oldName: "L+ /home/${builtins.replaceStrings [" "] ["\\x20"] oldName} - - - - ${builtins.replaceStrings [" "] ["\\x20"] userOpts.home}") userOpts.oldNames
		) cfg);

		home-manager.extraSpecialArgs.userParams = lib.mapAttrs (username: userOpts: {
			home-modules = "${userOpts.homeConfig}/home-modules";
		}) cfg;

		home-manager.users = lib.mapAttrs (username: userOpts: {
			imports = [
				(userOpts.homeConfig)
			];
		}) cfg;
	};
}

