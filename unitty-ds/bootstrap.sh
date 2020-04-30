#!/bin/bash

if [ $# -eq 0 ]
then
        echo "No URL arguments were provided."
        echo "Please use the following syntax to execute commands or script using UniTTY in your browser:"
        echo ""
        echo "syntax 1:"
        echo "http://host-ip-or-name:port-number/?arg=command1&arg=command2 command2-args"
        echo ""
        echo "syntax 2:"
        echo "http://host-ip-or-name:port-number/?arg=https://github-script-link-to-download-and-execute"
else
        echo $1 |grep -q https
        if [ $? -eq 0 ]
        then
                scriptName=$(echo $1 |awk -F/ '{print $NF}')
                curl -Lsq $1 -o /root/$scriptName
                chmod a+x /root/$scriptName
                echo $scriptName |grep .sh$ && bash -c /root/$scriptName
                echo $scriptName |grep .ps1$ && pwsh -c /root/$scriptName
        else
                for i in $*
                do
                        bash -c $i
                done
        fi
fi