#!/bin/bash

isDesktop="true"

yay -S --noconfirm --needed \
google-chrome

if [ $isDesktop = "true" ]; then
  yay -S xone-dkms
else
  yay -S xpadneo-dkms-git
fi
