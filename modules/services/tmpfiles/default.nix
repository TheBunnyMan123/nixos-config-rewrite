{
   pkgs,
   ...
}: {
   systemd.tmpfiles.rules = [
      "L+ /bin/bash - - - - ${pkgs.bashInteractive}/bin/bash" # /bin/bash symlink because people like to be not POSIX compliant
      "d /public 0777 root root - -" # Set public directory
      "A /etc/nixos - - - - user::rwx,user:bunny:rwx,group::rwx,mask::rwx,other::r-x" # Set bunny and root allowed to write to /etc/nixos
   ];
}

