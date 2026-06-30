{
	userParams,
	isGui,
	isGaming,
	...
}: {
	home.stateVersion = "23.05";
	imports = [
		"${userParams.solina.home-modules}/imagemagick"
		"${userParams.solina.home-modules}/useless-commands"
		"${userParams.solina.home-modules}/modern-coreutils"
		"${userParams.solina.home-modules}/fastfetch"
		"${userParams.solina.home-modules}/neovim"
		"${userParams.solina.home-modules}/tmux"
		"${userParams.solina.home-modules}/zsh"
		"${userParams.solina.home-modules}/git"
	] ++ (if isGui || isGaming then [
		"${userParams.solina.home-modules}/gui/mimeapps"
		"${userParams.solina.home-modules}/gui/niri"
		"${userParams.solina.home-modules}/gui/chromium"
		"${userParams.solina.home-modules}/gui/firefox"
		"${userParams.solina.home-modules}/gui/kitty"
		"${userParams.solina.home-modules}/gui/vencord"
	] else []) ++ (if isGaming then [
	] else []);
}

