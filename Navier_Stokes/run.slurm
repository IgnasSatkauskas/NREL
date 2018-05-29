#!/bin/bash
#SBATCH --time=00:10:00          # WALLTIME
#SBATCH -N 1                     # Number of nodes
#SBATCH --job-name vane3d        # Name of job
#SBATCH --account=LDR000         # program-based WCID  (type sbatch to view)
#SBATCH -p inter                 # ONLY use if want interactive queue
nodes=$SLURM_JOB_NUM_NODES       # Number of nodes (leave alone)
cores=1                          # MPI processes to start on each node

SESSION='ns2d'

#echo $SESSION   >  SESSION.NAME
#echo `pwd`'/'  >>  SESSION.NAME
#echo `date`'/' >>  SESSION.NAME

#rm -f ioinfo
#rm -f $SESSION.log
#rm -f $SESSION.his*
#rm -f $SESSION.sch
#rm -f $SESSION.out*
#rm -f $SESSION.ore*
#rm -f $SESSION.nre*

echo "==================================================================="
echo "                         Here we go"
echo "==================================================================="

./navier_stokes_2d

exit 0

