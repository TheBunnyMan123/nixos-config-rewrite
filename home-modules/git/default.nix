{
	...
}: {
	programs.git = {
		enable = true;
		settings = {
			pull.rebase = true;
			safe.directory = "*";
			
			user = {
				name = "TheBunnyMan123";
				email = "bunny@tkbunny.net";
			};
			alias = {
				lg-specific = "log --graph --abbrev-commit --decorate --pretty=\"format:%s <%C(yellow)%h%C(reset)>%n%C(blue)%ci %C(green)(%cr)%n%C()%an <%C(yellow)%ae%C(reset)>%n\"";
				lg = "lg-specific --all";
				graph = "lg";
			};
		};
	};
}

