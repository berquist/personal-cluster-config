#!/usr/bin/env bash

ansible-playbook deploy_slurm.yaml \
                 --inventory=./inventory.yaml \
                 --become \
                 --ask-become-pass
