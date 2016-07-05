#!/bin/bash
source './utils.sh'

declare -a FILES_TO_SYMLINK=(

    'bash/.bash_aliases'
    # 'bash/.bash_autocomplete'
    'bash/.bash_exports'
    'bash/.bash_functions'
    # 'bash/.bash_logout'
    # 'bash/.bash_options'
    'bash/.bash_profile'
    'bash/.bash_prompt'
    'bash/.bashrc'
    'bash/.inputrc'
    'bash/.bash.local'

    # 'git/.gitattributes'
    'git/.gitconfig'
    'git/.gitconfig.local'
    'git/.gitignore'

)

set_conf_files() {

    local i=''
    local sourceFile=''
    local targetFile=''

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    for i in "${FILES_TO_SYMLINK[@]}"; do

        sourceFile="$(pwd)/$i"
        targetFile="$HOME/.$(printf "%s" "$i" | sed -e "s/\<bash\>//g"  -e "s/\<git\>//g" )" #if in the bash|git folder, remove the bash folder when creating link

        if [ ! -e "$targetFile" ]; then
            execute "ln -fs $sourceFile $targetFile" "$targetFile → $sourceFile"
        elif [ "$(readlink "$targetFile")" == "$sourceFile" ]; then
            print_success "$targetFile → $sourceFile"
        else
            ask_for_confirmation "'$targetFile' already exists, do you want to overwrite it?"
            if answer_is_yes; then
                rm -rf "$targetFile"
                execute "ln -fs $sourceFile $targetFile" "$targetFile → $sourceFile"
            else
                print_error "$targetFile → $sourceFile"
            fi
        fi

    done

}

declare -a SETTINGS_TO_COPY=(

    'etc/wpa_supplicant/wpa_supplicant.conf'

    'etc/hostname'
    'etc/hosts'

    'etc/sudoers.d/10_student'

)

copy_settings_files() {

    local i=''
    local sourceFile=''
    local targetFile=''

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    for i in "${SETTINGS_TO_COPY[@]}"; do

        sourceFile="$(pwd)/$i"
        targetFile="/$(printf "%s" "$i")"

        if [ ! -e "$targetFile" ]; then
            execute "sudo cp $sourceFile $targetFile" "$targetFile → $sourceFile"
        elif [ "$targetFile" == "$sourceFile" ]; then
            print_success "$targetFile → $sourceFile"
        else
            ask_for_confirmation "'$targetFile' already exists, do you want to overwrite it?"
            if answer_is_yes; then
                mv "$targetFile" "$targetFile".old
                execute "sudo cp $sourceFile $targetFile" "$targetFile → $sourceFile"
            else
                print_error "$targetFile → $sourceFile"
            fi
        fi

    done
}

main() {

    # configuration files
    ask_for_confirmation "Do you want to set the configuration files?"
    printf '\n'

    if answer_is_yes; then
        set_conf_files
    fi

    ask_for_sudo

    # recommanded packages
    ask_for_confirmation "Do you want to install the recommanded packages?"

    if answer_is_yes; then
        ./os/install_packages.sh
    fi

    # settings files
    ask_for_confirmation "Do you want to install the settings files?"

    if answer_is_yes; then
        copy_settings_files
    fi

}

main
