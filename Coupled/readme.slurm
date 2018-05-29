25 Sept 2012

To run on redrock:

be sure you're on scratch 

sbatch ./run.slurm

You can modify things in run.slurm.    If the job is 4 hours or less, you
can run in the interactive queue, as clarified by

!/bin/bash
#SBATCH --time=04:00:00             # WALLTIME
#SBATCH -N 1                        # Number of nodes
#SBATCH --job-name vane3d           # Name of job
#SBATCH --account=CSC000            # program-based WCID 
#SBATCH -p inter                    # ONLY use if want inter queue
nodes=$SLURM_JOB_NUM_NODES          # Number of nodes
cores=1                             # MPI processes to start on each node

If you want to run for more than 4 hours, say 8 hours, comment out the inter
line:

!/bin/bash
#SBATCH --time=08:00:00             # WALLTIME
#SBATCH -N 1                        # Number of nodes
#SBATCH --job-name vane3d           # Name of job
#SBATCH --account=CSC000            # program-based WCID 
####SBATCH -p inter                    # ONLY use if want inter queue
nodes=$SLURM_JOB_NUM_NODES          # Number of nodes
cores=1                             # MPI processes to start on each node

Useful slurm commands:

squeue
sbatch
scancel

use man page for details, e.g. man squeue

Also see:
https://sccdata.nrel.gov/hpc/help




