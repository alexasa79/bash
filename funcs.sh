#!/bin/bash

px() {
	printf "%x\n" $@
}

pd() {
	num=0x$(echo $@ | sed 's/^0x//')
	printf "%d\n" $num
}

htons() {
	python -c 'import socket; print "%d" % socket.htons('$@')'
}

htonl() {
	python -c 'import socket; print "%x" % socket.htonl('$@')'
}

ip2num() {
	python -c "
import socket
import struct

a = socket.inet_aton('$@')
print '%#x' % struct.unpack('<L', a)[0]
"
}

num2ip() {
	python -c 'import socket; print socket.inet_ntoa('$@')'
}

=() {
	ex=$(echo "$@" | sed 's/ //g')
	echo $(($ex))
}

git_branch() {
	br=$(git branch 2> /dev/null)
	if [[ $? -eq "0" ]]; then
		brr=$(git branch 2> /dev/null | grep '^*' | colrm 1 2)
		echo :${brr}
	fi
}
#export PS1="\w (oracle1)\$(git_branch) --# "

