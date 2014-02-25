#! /usr/bin/env bash

#clear the results location
mkdir ../results/mods
rm ../results/mods/*

###Modularity
#loop through null community folders r00, r0, c0, r1
echo r00
echo 'Automated message' |mail -s 'hoth: running r00' mkl48@nau.edu
Files=../data/null/r00/*
for f in $Files
do
    echo $f
    echo modularity
    Rscript getMods.R $f ../results/modsr00.txt
    echo nestedness
    Rscript getNest.R $f ../results/nestr00.txt
    echo SES
    Rscript getCscore.R $f ../results/csr00.txt    
done

echo r0
echo 'Automated message' |mail -s 'hoth: running r0' mkl48@nau.edu
Files=../data/null/r0/*
for f in $Files
do
    echo $f
    echo modularity
    Rscript getMods.R $f ../results/modsr0.txt
    echo nestedness
    Rscript getNest.R $f ../results/nestr0.txt
    echo SES
    Rscript getCscore.R $f ../results/csr0.txt    
done

echo c0
echo 'Automated message' |mail -s 'hoth: running c0' mkl48@nau.edu
Files=../data/null/c0/*
for f in $Files
do
    echo $f
    echo modularity
    Rscript getMods.R $f ../results/modsc0.txt
    echo nestedness
    Rscript getNest.R $f ../results/nestc0.txt
    echo SES
    Rscript getCscore.R $f ../results/csc0.txt    
done

echo r1
echo 'Automated message' |mail -s 'hoth: running r1' mkl48@nau.edu
Files=../data/null/r1/*
for f in $Files
do
    echo $f
    echo modularity
    Rscript getMods.R $f ../results/modsr1.txt
    echo nestedness
    Rscript getNest.R $f ../results/nestr1.txt
    echo SES
    Rscript getCscore.R $f ../results/csr1.txt    
done

#email notification
echo 'Automated message' |mail -s 'hoth: getStats.sh done.' mkl48@nau.edu