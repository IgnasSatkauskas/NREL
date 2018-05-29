#!/bin/bash
#SBATCH --time=24:00:00             # WALLTIME
#SBATCH -N 1                        # Number of nodes
#SBATCH --job-name vane3d           # Name of job
#SBATCH --account=CSC000            # program-based WCID 
##SBATCH -p inter                    # ONLY use if want inter queue
nodes=$SLURM_JOB_NUM_NODES          # Number of nodes
cores=1                             # MPI processes to start on each node

SESSION='euler_ns'

echo $SESSION   >  SESSION.NAME
echo `pwd`'/'  >>  SESSION.NAME
echo `date`'/' >>  SESSION.NAME

rm -f ioinfo
rm -f $SESSION.log
rm -f $SESSION.his*
rm -f $SESSION.sch
rm -f $SESSION.out*
rm -f $SESSION.ore*
rm -f $SESSION.nre*

echo "==================================================================="
echo "                         Here we go"
echo "==================================================================="

./euler_ns

exit 0

