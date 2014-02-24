#!/bin/bash
# Program: Rename image.xxx to image-1.xxx


count=1
for img in *.jpg *.png *.gif
do
   new=IMG-${count}.${img##*.}
   mv $img $new 2>/dev/null
   if [ 0 -ne $? ]; then
       echo "rename $img failuer"
   else 
       let count++
   fi
done

