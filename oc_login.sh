#!/bin/bash
oc login --token=$ENV_TOKEN --server=$ENV_SERVER
node-red clone-reinstate-flow.json