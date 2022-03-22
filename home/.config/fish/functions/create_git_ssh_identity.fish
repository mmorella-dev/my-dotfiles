### Creates 
function create_git_ssh_identity
    # change this if something breaks
    set -l SSH_KEY_TYPE ed25519


    # Helper function to print green text
    function __cgsi_echo_info
        set_color -o green; echo $argv; set_color normal;
    end
    # Helper function to print red text
    function __cgsi_echo_warning
        set_color -o red; echo $argv; set_color normal;
    end
    # Check that the 
    function __cgsi_validate_id
        if string match -rq '^[A-Za-z0-9_-]+$' $argv
            return 0
        else
            echo "Error: identifier '$argv' must be alphanumeric"
            return 1
        end
    end
    # Check that an email address is valid
    function __cgsi_validate_email # for argparse
        if string match -rq '^[^@ \t\r\n]+@[^@ \t\r\n]+\.[^@ \t\r\n]+$' $argv
            return 0
        else
            echo "Error: '$argv' is not a valid email address"
            return 1
        end
    end
    function __cgsi_help
        echo
        echo 'usage: create_git_ssh_identity [-h] [-g URL] LABEL NAME EMAIL'
        echo \t-h/--help\t\tShow this help message
        echo \t-g/--git-host URL\t'Use a Git host other than github.com'
        echo \tLABEL\tDirectory name\t"(e.g. 'work' for ~/git/work)"
        echo \tNAME\tCommitter name\t"(e.g. 'Jane Smith')"
        echo \tEMAIL\tCommitter email\t"(e.g. jsmith@example.com)"
        echo
        echo "To get an anonymous email (e.g. 123456+jsmith@users.noreply)"
        echo ' • https://github.com/settings/emails'
        echo ' • https://gitlab.com/-/profile'
    end

    ### PARSE ARGUMENTS ###
    if not argparse -n create_git_ssh_identity -X3 \
        'h/help' \
        'g/git-host=' \
         -- $argv
        __cgsi_help
        return 1
    end
    
    if [ -z "$_flag_g" ]
        set _flag_g "github.com"
    end

    if [ -n "$_flag_help" ]
        __cgsi_help
        return 0
    end
    set -l id $argv[1]
    set -l name $argv[2]
    set -l email $argv[3]

    if [ -z "$id" -o -z "$name" -o -z "$email" ]
        __cgsi_help
        return 1
    end
    __cgsi_validate_email $email
    or return 1
    __cgsi_validate_id $id
    or return 1

    set -l GITCONFIG_FILE ~/git/.gitconfig
    
    
    # Configure SSH_config
    set -l path_to_ssh_id ~/.ssh/id_ed25519_$id
    set -l ssh_config \
\n"# git SSH identity ($id)
Host $_flag_g-$id
    HostName $_flag_g
    User git
    IdentityFile $path_to_ssh_id"\n

    set -l path_to_git_dir ~/git/$id/
    set -l path_to_gitconfig $path_to_git_dir.gitconfig
    
    # Add to gitconfig
    set -l global_gitconfig \
\n"[includeIf \"gitdir:$path_to_git_dir\"]
    path = $path_to_gitconfig"\n

    # Create gitconfig
    set -l local_gitconfig \
\n"[user]
    name = $name
    email = $email"\n

    __cgsi_echo_warning "This operation will do the following:"
    __cgsi_echo_info "(1) Generate SSH key:"
    echo \$ ssh-keygen -t ed25519 -C $email -f $path_to_ssh_id
    # echo \$ 'eval (ssh-agent -c)'
    echo \$ ssh-add $path_to_ssh_id
    echo
    __cgsi_echo_info "(2) Append to your ~/.ssh/config:"
    echo $ssh_config
    echo
    __cgsi_echo_info "(3) Append to your ~/.gitconfig:"
    echo $global_gitconfig
    echo
    __cgsi_echo_info "(4) Create $path_to_gitconfig:"
    echo $local_gitconfig
    echo

    read -l -P "Continue? (y/N)" -n1 yn
    if [ "$yn" != 'y' -a "$yn" != 'Y' ]
        echo "Aborted."
        return 1
    end
    ssh-keygen -q -t ed25519 -C $email -f $path_to_ssh_id
    # eval -q (ssh-agent -c)
    ssh-add $path_to_ssh_id
    # write SSH config
    mkdir -p ~/.ssh/
    echo $ssh_config >> ~/.ssh/config
    echo $global_gitconfig >> ~/.gitconfig
    mkdir -p $path_to_git_dir
    echo $local_gitconfig > $path_to_gitconfig
    __cgsi_echo_info " === Copy this public key to your Git host: === "
    cat $path_to_ssh_id.pub
    __cgsi_echo_info " === Then try running \$ ssh -T git@$_flag_g-$id === "
end