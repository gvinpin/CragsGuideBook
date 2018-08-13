#!/usr/bin/sed


/<tr/{
n;
/th/!{
n;n;p;
a\ \&
n;n;n;n;n;n;n;n;n;n;n;p;
a\ \&
n;p;
a\ \&
n;n; s/.*\">//; s/<\/a>//;p;a\ \\\\
}
}
