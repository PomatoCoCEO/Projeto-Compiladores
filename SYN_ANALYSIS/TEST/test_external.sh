#!/usr/bin/bash/
i=0; 
pref='../TEST/External Tests/'
for f in $(ls "$pref"); do 
    if [[ ${f: -3:3} == 'dgo'  ]]; then
        echo $i; 
        echo $f;
        ./gocompiler < "$pref$f" > "$pref${f::-3}ans"
        diff "$pref${f::-3}ans" "$pref${f::-3}out"
    fi
done