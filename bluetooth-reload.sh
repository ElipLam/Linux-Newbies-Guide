#!/bin/bash

sudo rmmod btusb

sudo modprobe -v btusb

sudo systemctl restart bluetooth
