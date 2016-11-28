#!/bin/bash


volume() {
	volume=$(amixer get Master|tail -1|cut -sd% -f1)
	volume=$(sed -u s'@\[@@'g <<<${volume:(-3)})
	echo $volume
}

volume

