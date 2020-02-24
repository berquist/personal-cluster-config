#!/usr/bin/env bash

ansible-playbook copy_slurm_config.yaml \
                 --inventory ../inventory.yaml \
                 --become \
                 --ask-become-pass
