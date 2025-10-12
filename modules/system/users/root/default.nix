{
   pkgs,
   ...
}: {
   users.users.root = {
      name = "root";
      hashedPassword = "$y$j9T$r7Q60T/F48oyLnK8OnVXT.$cbSoNXPw3WbC9nW.nvQ5VpXYmwC3HmIuQoykavM4lGD";
      shell = pkgs.bash;
      uid = 0;
      home = "/root";
   };
}

