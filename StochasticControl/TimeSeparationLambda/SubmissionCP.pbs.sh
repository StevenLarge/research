#!/bin/bash
# PBS -S /bin/bash

#PBS run script for Westgrid Jobs

cd $PBS_O_WORKDIR

echo 'Current Working Directory is `pwd`'
echo 'Running job on Hostname `hostname`'

echo 'Starting run at: `date`'

python CPGenerator.py

echo 'Finished Execution'