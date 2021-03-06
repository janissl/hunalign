#!/bin/bash

mkdir -p langpairs/fulldict

awk 'BEGIN {
langnum=0
while ( getline < "langs.txt" )
{
    lang[langnum]=$0
    ++langnum;
}

for (i=0; i<langnum-1; ++i )
{
for (j=i+1; j<langnum; ++j )
{
    l1=lang[i];
    l2=lang[j];
    print l1,l2
    p = l1 "-" l2 ".dic"
    system("bash hunalign/scripts/DCEP/normalizedict.sh < langpairs/autodict/" p " > langpairs/fulldict/" p )
    system("bash hunalign/scripts/DCEP/normalizesztakidict.sh < langpairs/sztaki/" p " >> langpairs/fulldict/" p " 2> /dev/null" )
}
}

}'
