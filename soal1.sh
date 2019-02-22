#!/bin/bash
i=1
for pict in /home/nanda/nature/*.jpg
do
  base64 -d "$pict" | xxd -r > "/home/nanda/nature/photo"$i".jpg"
  let i++
done
