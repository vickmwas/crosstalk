#!/usr/bin/env bash
find /home/ubuntu/CROSSTALK/logs -type f -mmin +180 -exec rm {} \;