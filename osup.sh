#!/bin/bash

#simple repo refresh
apt update

#upgrade packages
apt upgrade -y

#update packages from the distro itself and kernel
apt dist-upgrade -y

#remove dependecies which are no longer in use
apt autoremove -y

#purge configurations from removed packages (good clean-up, harder syntax). especially good on servers which tend to not include gui and/or synaptic.
dpkg -l | awk '/^rc/ {print $2}' | xargs dpkg --purge

#remove installation packages (*.deb) from on-disk-cache
apt clean
