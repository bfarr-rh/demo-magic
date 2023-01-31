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

pe "oc new-project app-modernisation"

# 
pe "skupper init --site-name publiccloud --console-auth=internal --console-user=admin --console-password=password"

# 
pe "oc get pods,svc"

cmd

pe "skupper token create --token-type cert pc-token.yaml"

cmd

pe "cat pc-token.yaml"

cmd

pe "skupper link status"

cmd

pe "oc apply -f ../../jboss-breakdown-monolith/yaml/frontend.yaml"

# enters interactive mode and allows newly typed command to be executed
cmd

cmd
cmd
cmd
cmd
cmd

# show a prompt so as not to reveal our true nature after
# the demo has concluded
p ""
