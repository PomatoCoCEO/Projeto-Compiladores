
external="../test/meta3/gitComp"

for i in $(ls $external); do
    if [[ "$i" =~ .*.dgo ]]; then
        echo $i
        ./gocompiler < "$external/$i" > ans.out | sort
        cat "$external/${i:: -3}out" > ans.ans
        diff ans.out ans.ans
        sleep 1
    fi
done