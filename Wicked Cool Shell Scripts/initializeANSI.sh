#!/bin/bash
initializeANSI(){
  esc="\033"
  #foreground colors
  blackf="${esc}[30m"; redf="${esc}[31m"; greenf="${esc}[32m";
  yellowf="${esc}[33m"; bluef="${esc}[34m"; purplef="${esc}[35m";
  cyanf="${esc}[36m"; whitef="${esc}[37m";
  #background color
  blackb="${esc}[30m"; redb="${esc}[31m"; greenb="${esc}[32m";
  yellowb="${esc}[33m"; blueb="${esc}[34m"; purpleb="${esc}[35m";
  cyanb="${esc}[36m"; whiteb="${esc}[37m";
  #bold, italic, underline, and inverse style toggles
  boldon="${esc}[1m"; boldoff="${esc}[22m";
  italicson="${esc}[3m"; italicsoff="${esc}[23m";
  ulon="${esc}[4m"; uloff="${esc}[24m";
  invon="${esc}[7m"; invoff="${esc}[27m";

  reset="${esc}[0m"
}
