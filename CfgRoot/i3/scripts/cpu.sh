#!/bin/bash

mpstat 1 1|awk 'END{sub(/,/,"."); print $3}'
