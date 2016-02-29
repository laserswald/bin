#!/bin/sh
xdpyinfo -ext XINERAMA | sed '/^  head #/!d;s///' |
while IFS=' :x@,' read i w h x y; do
    import -window root -crop ${w}x$h+$x+$y /tmp/$i.png
done
convert +append /tmp/0.png /tmp/1.png screenshot.png
rm /tmp/{0,1}.png
