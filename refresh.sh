#! /bin/bash

find . -type f -name *.ebuild -exec ebuild {} digest \;
