function rainbow_cat
    set -l colors red blue yellow green cyan magenta
    set -l i (random 1 (count $colors))
    cat /dev/stdin | while read line
        set_color $colors[$i]
        echo "$line"
        set i (math "$i + 1")
        if test $i -gt (count $colors)
            set i 1
        end
    end
end
