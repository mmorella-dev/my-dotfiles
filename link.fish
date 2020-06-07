#!/usr/bin/env fish

# Creates symlinks in system directories

function is_same_file -a path1 path2 -d "Checks if `realpath` resolves two paths to the same file"
    # attempt to normalize test, prioritizing GNU CoreUtils
    set test (command -s test)
    command -q gtest; and set test (command -s gtest)
    $test $path1 -ef $path2
    return $status
end

function read_confirm
    while true
        read -l -n 1 $argv confirm
        switch $confirm
            case Y y
                return 0
            case '' N n
                return 1
        end
    end
end

function make_links
    set source_files $argv[1..-2]
    set target_dir $argv[-1]

    for f in $source_files
        if [ (basename $f) = ".DS_Store" ]
            continue
        end

        set target_file $target_dir/(basename $f)
        if is_same_file $f $target_file
            set_color --bold cyan
            echo "$f is already linked ($target_file)."
        else
            if [ -f "$target_file" ]
                read_confirm -p "set_color --bold red; printf '$target_file already exists. Overwrite? [y/n] '"
                if [ $status -eq 0 ]
                    set_color green
                    ln -vsF (realpath $f) (realpath $target_dir)
                end
            else
                set_color --bold green
                ln -ivs (realpath $f) (realpath $target_dir)
            end
        end
        set_color normal
    end
end

make_links ./home/{.*,*} $HOME
make_links ./config/{.*,*} $HOME/.config
make_links ./fish/{.*,*} $HOME/.config/fish
