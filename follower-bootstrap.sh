#!/bin/bash
cat << EOL | kubectl -n conjur2 apply -f - 
apiVersion: v1
kind: Secret
metadata:
  name: "follower-seedfile"
data:
  FOLLOWER_SEED_FILE: |
$(base64 -i "follower_seed.tar" | awk '{ print "    " $0 }')
  FOLLOWER_START_SCRIPT: |
$(base64 -i "start-follower.sh" | awk '{ print "    " $0 }')
EOL
