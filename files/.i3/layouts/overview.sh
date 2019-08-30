#!/bin/sh

array=( $(i3-msg -t get_workspaces | grep -oP '"name":"\K(.)') )
numbers=( 1 2 3 4 5 6 7 8 )

finished="f"
for z in "${numbers[@]}"
do
   if [ "$finished" = "t" ]
   then
      break
   fi

   match="f"
   for i in "${array[@]}"
   do
      if [ "$i" = "$z" ]
      then
         match="t"
      fi
   done
   if [ "$match" = "f" ]
   then
      finished="t"
      break
   fi
done

i3-msg "workspace $z" 
i3-msg "exec gitkraken"
i3-msg "exec slack"
i3-msg "exec --no-startup-id chromium"
i3-msg "exec --no-startup-id chromium"