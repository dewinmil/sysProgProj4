#!/bin/gawk -f
BEGIN {FS=":"
print "user_name            password  uid      gid      full_name                             home                            shell"
print "=========================================================================================================================================="	
uid=0
gid=0
}


{if ($3 > uid)
  {uid = $3}}
{if ($4 > gid)
  {gid = $4}}
{printf"%-21s", $1
printf"%-10s", $2
printf"%-9s", $3
printf"%-9s", $4
printf"%-38s", $5
printf"%-32s", $6
printf $7
printf"\n"}
#{printf"%-15s", $1, $2, $3, $4, $5, $6, $7}
END {printf "Next uid: %d\n", uid+1
     printf "Next gid: %d\n", gid+1
}
