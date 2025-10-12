{
   ...
}: {
   programs.git = {
      enable = true;
      userName = "TheBunnyMan123";
      userEmail = "bunny@tkbunny.net";
      includes = [
         {
            contents = {
               safe = {
                  directory = "*";
               };
            };
         }
      ];
      aliases = {
         lg-specific = "log --graph --abbrev-commit --decorate --pretty=\"format:%s <%C(yellow)%h%C(reset)>%n%C(blue)%ci %C(green)(%cr)%n%C()%an <%C(yellow)%ae%C(reset)>%n\"";
         lg = "lg-specific --all";
         graph = "lg";
      };
   };
}

