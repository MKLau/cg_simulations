#! /usr/bin/env bash

#start a screen session and navigate to src
screen -dmS "cgsim"
screen -S cgsim -p 0 -X stuff $'ssh compute-0-0\n'
screen -S cgsim -p 0 -X stuff $'cd projects/cg_simulations/src\n'

###mkComs
screen -S cgsim -p 0 -X stuff $'Rscript --verbose mkComs.R\n'
echo '...' |mail -s 'hoth: mkComs setup done.' mkl48@nau.edu

###mkNull
screen -S cgsim -p 0 -X stuff $'Rscript --verbose mkNull.R\n'
echo '...' |mail -s 'hoth: mkNull setup done.' mkl48@nau.edu

