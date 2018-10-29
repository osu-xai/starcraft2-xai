#!/bin/bash
IMAGE_FILE=/scratch/eecs-share/sc2/pysc2.simg
EXEC_FILE=/scratch/eecs-share/sc2/miniconda_shell.sh
singularity exec --bind /nfs/eecs-fserv/share:/scratch/eecs-share $IMAGE_FILE $EXEC_FILE
