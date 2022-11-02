#!/bin/bash

for package in $(grep -vE "^\s*#" $1  | tr "\n" " "); do
	sudo apt-get install -y $package
done
