#!/bin/bash

battery() {
	local battery=$(acpi -b|awk '{print $4}')
	echo ${battery%%%*}
}

battery
