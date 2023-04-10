#!/bin/sh
amulecmd -c "show dl" | \
	grep '.' | \
	sed "1,/Succeeded/d" | \
	sed -n "N;s/^ > .*[0-9A-F]\{32\} \(.*\)\n >.*\[\(.*%\)\].*]\(.*\)/\2 \1\3/p" | \
	sort -n
