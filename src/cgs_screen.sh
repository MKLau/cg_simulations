#! /usr/bin/env bash

#start a screen session and navigate to src
screen -dmS "cgsim"
screen -S cgsim -p 0 -X stuff $'ssh compute-0-0\n'
screen -S cgsim -p 0 -X stuff $'cd projects/cg_simulations/src\n'

###mkComs
screen -S cgsim -p 0 -X stuff $'Rscript --verbose mkComs.R\n'
echo '...' |mail -s 'hoth: mkComs done.' mkl48@nau.edu

###mkNull
screen -S cgsim -p 0 -X stuff $'Rscript --verbose mkNull.R\n'
echo '...' |mail -s 'hoth: mkNull done.' mkl48@nau.edu

###Stats
#start 3 more screen sessions
screen -S cgsim -X screen
screen -S cgsim -X screen
screen -S cgsim -X screen

#r00
screen -S cgsim -p 0 -X stuff $'sh getStatsr00.sh\n'

#r0
screen -S cgsim -p 1 -X stuff $'ssh compute-0-0\n'
screen -S cgsim -p 1 -X stuff $'cd projects/cg_simulations/src\n'
screen -S cgsim -p 1 -X stuff $'sh getStatsr0.sh\n'

#c0
screen -S cgsim -p 2 -X stuff $'ssh compute-0-0\n'
screen -S cgsim -p 2 -X stuff $'cd projects/cg_simulations/src\n'
screen -S cgsim -p 2 -X stuff $'sh getStatsc0.sh\n'

#r1
screen -S cgsim -p 3 -X stuff $'ssh compute-0-0\n'
screen -S cgsim -p 3 -X stuff $'cd projects/cg_simulations/src\n'
screen -S cgsim -p 3 -X stuff $'sh getStatsr1.sh\n'

#email notification
echo '...' |mail -s 'hoth: cg simulation setup is done.' mkl48@nau.edu