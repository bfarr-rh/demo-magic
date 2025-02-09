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

# put your demo awesomeness here
pe "ps -ef | grep jboss"

pe "ls ../../jboss-eap-7.4/standalone/deployments/"

cmd

pe "podman ps"


pe "oc new-project app-modernisation"

pe "skupper init --enable-console --enable-flow-collector --site-name onpremises --console-auth=internal --console-user=admin --console-password=password"

cmd

pe "skupper status"

cmd

pe "oc get pods,svc"

cmd

pe "skupper gateway expose backend 127.0.0.1 8080 --type podman"

pe "skupper gateway status"

cmd

pe "oc get pods,svc"

pe "oc get svc/backend -o yaml"

cmd

pe "oc apply -f ../../jboss-breakdown-monolith/yaml/frontend.yaml"

cmd

pe "oc get pods,svc"

cmd 

cmd

cmd

pe "skupper link create pc-token.yaml"

cmd

pe "skupper link status"

cmd

#cmd
#pe "skupper gateway unbind backend"
cmd
pe "skupper gateway unexpose backend"

cmd

pe "skupper gateway expose db 127.0.0.1 5432 --type podman"

cmd

pe "oc apply -f ../../jboss-breakdown-monolith/yaml/backend.yaml"

cmd

pe "oc get pods,svc"

cmd

cmd
# 
pe "skupper expose deployment backend --port 8080"

# 
pe "skupper service status"

pe "skupper gateway status"

# enters interactive mode and allows newly typed command to be executed
cmd
cmd
cmd
cmd
cmd
cmd
cmd

# show a prompt so as not to reveal our true nature after
# the demo has concluded
p ""
