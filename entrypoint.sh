#!/bin/sh
set -e
while getopts "hc:p:l:s:r:" o; do
    case "${o}" in
        h)
            echo "-c <custom rules path (optional)> -p <path to scan> -l <level (optional)> -s <sarif file name (optional)>"
            exit 0
        ;;
        c)
            export customRules=${OPTARG}
        ;;
        p)
            export path=${OPTARG}
        ;;
        l)
            export level=${OPTARG}
        ;;
        s)
            export sarif_file=${OPTARG}
        ;;
        r)
            export release=${OPTARG}
        ;;
    esac
done
ARGS=""

if [ $release ]; then
    ludvig pack --output-file $release
    return
fi

if [ $customRules ]; then
    customRulesArg="--custom-rules $customRules"
    ARGS="$ARGS $customRulesArg"
fi

if [ $level ]; then
    levelArg="--severity-level $level"
    ARGS="$ARGS $levelArg"
fi

if [ $sarif_file ]; then
    sarifFileArg="--output-sarif $sarif_file"
    ARGS="$ARGS $sarifFileArg"
fi

ludvig fs scan --path ${path} ${ARGS} -otable