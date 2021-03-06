#!/usr/bin/env sh
#$ -N coms
#$ -pe mpi 1
#$ -M mkl48@nau.edu
#$ -m as
#Wall time:
#$ -l h_rt=1:30:00

###Submission loop:
###for case in $ql; do qsub -o ~/qmonitor -e ~/qmonitor -cwd -v case=$case $cgssrc/qStats_coms.sh; sleep 20; done
###Note: sleep can be used to delay submissions

cp /home/mlau/projects/cg_simulations/src/cgsMods.R ./
cp /home/mlau/projects/cg_simulations/src/cgsNest.R ./
cp /home/mlau/projects/cg_simulations/src/cgsCscore.R ./
echo "starting case number $case"
Rscript cgsMods.R $case ~/projects/cg_simulations/results/mods_coms.txt
Rscript cgsNest.R $case ~/projects/cg_simulations/results/nest_coms.txt
Rscript cgsCscore.R $case ~/projects/cg_simulations/results/cscore_coms.txt
echo "completed case number $case"

### Fix this!
### rm $PBS_O_WORKDIR/cgsMods.R
### rm $PBS_O_WORKDIR/cgsNest.R
### rm $PBS_O_WORKDIR/cgsCscore.R