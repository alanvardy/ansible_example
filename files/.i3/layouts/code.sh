#!/bin/sh

array=( $(i3-msg -t get_workspaces | grep -oP '"name":"\K(.)') )
numbers=( 1 2 3 4 5 6 )

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

i3-msg "workspace $z; append_layout /home/vardy/.i3/layouts/1.json" 

i3-msg "exec --no-startup-id code"
i3-msg "exec --no-startup-id chromium --incognito"
i3-msg "exec --no-startup-id firefox-developer-edition -private"

sleep 2

i3-msg "workspace 7; append_layout /home/vardy/.i3/layouts/7.json" 
i3-msg "exec --no-startup-id gnome-terminal"
i3-msg "exec --no-startup-id gnome-terminal"
i3-msg "exec --no-startup-id gnome-terminal"

sleep 1

i3-msg "workspace 8" 
i3-msg "exec --no-startup-id chromium"