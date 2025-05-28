#!/bin/bash

PATH="/usr/sbin/:$PATH"
textfiledir="/tmp/textfiles"
prefix="bindrndc"
outputfile=""$textfiledir"/${prefix}.prom"

outputmetrics(){
status="$(rndc status)"
version="$(awk '/^version:/{print $3}' <<< "$status")"
cat << EOF
${prefix}_version{version="$version"} $(awk -F. '{print $1}' <<< "$version")
${prefix}_udplisteners $(awk -F': ' '/^UDP listeners per interface:/{print $2}' <<< "$status")
${prefix}_debuglvl $(awk -F': ' '/^debug level:/{print $2}' <<< "$status")
${prefix}_xfersrunning $(awk -F': ' '/^xfers running:/{print $2}' <<< "$status")
${prefix}_xfersdeffered $(awk -F': ' '/^xfers deferred:/{print $2}' <<< "$status")
${prefix}_soaprogress $(awk -F': ' '/^soa queries in progress:/{print $2}' <<< "$status")
${prefix}_recursiveclients $(awk -F': ' '/^recursive clients:/{print $2}' <<< "$status"|awk -F'/' '{print $1}')
${prefix}_tcpclients $(awk -F': ' '/^tcp clients:/{print $2}' <<< "$status"|awk -F'/' '{print $1}')
${prefix}_tcphighwater $(awk -F': ' '/^TCP high-water:/{print $2}' <<< "$status")
EOF
}

outputmetrics > "$outputfile".$$
mv "$outputfile".$$ "$outputfile"
