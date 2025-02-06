#!/bin/bash
# Script that shows terminal colors
# -- elenapan @ github

f=3 b=4
for j in f b; do
  for i in {0..7}; do
    printf -v $j$i %b "\e[${!j}${i}m"
  done
done
d=$'\e[1m'
t=$'\e[0m'
v=$'\e[7m'

# Symbol
s=
# s=

cat << EOF

 $f0$s$d$s$t $f1$s$d$s$t $f2$s$d$s$t $f3$s$d$s$t
 $f4$s$d$s$t $f5$s$d$s$t $f6$s$d$s$t $f7$s$d$s$t

EOF
