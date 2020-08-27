#!/usr/bin/env fish

# Creates symlinks in system directories

function is_same_file -a path1 path2 -d "Checks if `realpath` resolves two paths to the same file"
    # requires that builtin 'test' command supports `-ef` argument, which fish does not have
    # this is true for OSX, BSD, and GNU test, but not for POSIX sh
    command test $path1 -ef $path2
    return $status
end

function read_confirm
    read -l -n1 -P $argv -- CONFIRM
    if string match -rq "[Yy]" -- $CONFIRM
        return 0
    else
        return 1
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
