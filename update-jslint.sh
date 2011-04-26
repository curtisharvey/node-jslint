#!/bin/sh

src="http://jslint.com/jslint.js"
out="`dirname $0`/lib/jslint.js"

# use wget if available, curl if not
if type -t wget > /dev/null; then
    fetch_cmd="wget -O"
elif type -t curl > /dev/null; then
    fetch_cmd="curl -o"
else
    echo "wget or curl must be installed to fetch '$src'";
    exit 1;
fi

$fetch_cmd "$out" "$src" &&
    echo "\n// export for node-jslint\nmodule.exports = JSLINT;" >> "$out"
