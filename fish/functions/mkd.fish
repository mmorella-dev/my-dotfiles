function mkd
    mkdir -p $argv
    if test $status -eq 0
        cd $argv[-1]
    end
end
