#!/bin/bash

cd ~/storage/shared/priscillafx-storage
git add .
git commit -m "Android Sync $(date)"
git pull
git push
