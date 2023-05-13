#!/usr/bin/env bash
# This script downloads and applies the required modifications to the ACPI tables in order for the sound to work on the ASUS Zenbook 3402za
# and similar laptops using the same chip. 
mkdir ./audio-build && cd ./audio-build
curl https://raw.githubusercontent.com/thor2002ro/asus_zenbook_ux3402za/main/Sound/ssdt-csc3551.dsl -o ssdt-csc3551.dsl
curl https://raw.githubusercontent.com/thor2002ro/asus_zenbook_ux3402za/main/Sound/01_acpi -o 01_acpi

iasl -tc ssdt-csc3551.dsl

sudo cp -f ssdt-csc3551.aml /boot
sudo cp -f 01_acpi /etc/grub.d

sudo chmod +x /etc/grub.d/01_acpi
sudo update-grub
