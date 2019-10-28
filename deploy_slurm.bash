#!/usr/bin/env bash

ansible-playbook deploy_slurm.yaml \
                 --ask-become-pass \
                 --inventory=./inventory
