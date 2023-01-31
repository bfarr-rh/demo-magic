#!/usr/bin/env bash

#################################
# include the -=magic=-
# you can pass command line args
#
# example:
# to disable simulated typing
# . ../demo-magic.sh -d
#
# pass -h to see all options
#################################
. ../demo-magic.sh


########################
# Configure the options
########################

#
# speed at which to simulate typing. bigger num = faster
#
# TYPE_SPEED=20

#
# custom prompt
#
# see http://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/bash-prompt-escape-sequences.html for escape sequences
#
DEMO_PROMPT="${GREEN}➜ ${CYAN}\W ${COLOR_RESET}"

# text color
# DEMO_CMD_COLOR=$BLACK

# hide the evidence
clear

# enters interactive mode and allows newly typed command to be executed
cmd

pe "skupper gateway expose db 127.0.0.1 5432 --type podman"

pe "oc project app-modernisation"

pe "oc apply -f ../../jboss-breakdown-monolith/yaml/backend.yaml"

pe "skupper gateway unexpose backend"
pe "skupper gateway unbind backend"

cmd
# 
pe "skupper expose deployment backend --port 8080"

# 
pe "skupper service status"

pe "skupper gateway status"

cmd

pe "oc get svc,pods"

# enters interactive mode and allows newly typed command to be executed
cmd

# show a prompt so as not to reveal our true nature after
# the demo has concluded
p ""
