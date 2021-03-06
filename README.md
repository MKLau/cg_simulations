cg_simulations
==============

Community genetics simulations for the Lau et al. 2014 manuscript.

See notebook/notebook.Rnw for the simulations. 

Network analyses were conducted using the Hoth parallel computing cluster at NAU.

Workflow Summary
- Create simulated communities using mkComs.R
- Generate null communities using mkNull*.R (separate for r00,r0,c0,r1)
- Conduct stats for Cscores, Nestedness and Modularity using cgs_Stats.sh
- Post process results (cs.txt,nest.txt,mods.txt and .txt.names.txt for the associated community)
- Get observed (i.e. original) community structure
