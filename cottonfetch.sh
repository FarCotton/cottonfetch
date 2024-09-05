#!/usr/bin/env bash

if [[ $* == *--help ]]; then

    SCRIPTDIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

    echo
    echo "cottonfetch v1.4"
    echo "created by @plasmacotton"
    echo
    echo "special thanks to:"
    echo "• lilliana.raquel (discord)"
    echo "• ._peachfuz (discord)"
    echo "• devereo_bassico (discord)"
    echo "• fernozzle.xml (discord) for being an awesome and supporting person :D"
    echo "• Mikel (stackoverflow)"
    echo "• Dave Dopson (stackoverflow)"
    echo
    echo "you can alias cottonfetch to a command you can use anywhere by cd'ing into the location of it and running the following:"
    echo "echo \"alias \\\"cottonfetch\\\"=\\\"bash $SCRIPTDIR/cottonfetch\\\"\""" >> ~/.bashrc"
    echo
    echo "THE ALIAS BREAKS WHEN THE FILE LOCATION CHANGES!!! RE-RUN THE COMMAND WITH THE NEW DIRECTORY WHEN YOU WANT TO MOVE IT!!!"
    echo
    echo "thank you for using cottonfetch <3"
    echo

else

    LINE1=""
    LINE2=""
    LINE3=""
    LINE4=""
    LINE5=""
    LINE6=""
    LINE7=""
    LINE8=""
    LINE9=""

    MSGN=`echo $(($RANDOM % 5))`

    # thanks devereo_bassico !!

    case $MSGN in
      1) MSG="LLA LIAH FARCOTTON!!!" ;;
      2) MSG="olleh!" ;;
      3) MSG="JOIN THE COTTON CULT!!!" ;;
      4) MSG="i esu cottonfetch wtb" ;;
      *) MSG="sknaht rof gnisu cottonfetch!" ;;
    esac

    # thanks Mikel !

    if [ -f /etc/os-release ]; then
        . /etc/os-release
        DISTRO=$NAME
        VER=$VERSION_ID
    elif type lsb_release >/dev/null 2>&1; then
        DISTRO=$(lsb_release -si)
        VER=$(lsb_release -sr)
    elif [ -f /etc/lsb-release ]; then
        . /etc/lsb-release
        DISTRO=$DISTRIB_ID
        VER=$DISTRIB_RELEASE
    elif [ -f /etc/debian_version ]; then
        DISTRO=Debian
        VER=$(cat /etc/debian_version)
    elif [ -f /etc/SuSe-release ]; then
        ...
    elif [ -f /etc/redhat-release ]; then
        ...
    else
        DISTRO=$(uname -s)
        VER=$(uname -r)
    fi

    if test -d /bedrock; then
      DISTRO='Bedrock'
      VER=''
    fi

    # this is what cottonfetch detects, very advanced, i know

    OS=`uname -o`
    KERNEL=`uname`
    KERNELVER=`uname -r`
    ARCH=`uname -m`
    HOST=`uname -n`
    USERNAME=`whoami`

    TEMP=`free -m | grep "Mem"`
    TEMP2="${TEMP//"Mem:"}"

    # sorry FreeBSD users!! you sadly have to see your RAM in bytes for now :(
    
    if [[ "$DISTRO" == 'FreeBSD' ]]; then
        RAM=`echo $((`sysctl -n vm.stats.vm.v_page_count` * `sysctl -n hw.pagesize`)) |`
        RAMUSED=`echo $(((`sysctl -n vm.stats.vm.v_page_count` - `sysctl -n vm.stats.vm.v_free_count`) * `sysctl -n hw.pagesize`))`
    else
        RAM=`echo $TEMP2 | awk '{print $1}'`
        RAMUSED=`echo $TEMP2 | awk '{print $2}'`
    fi

    TEMP3=`cat /proc/cpuinfo | grep "model name" | sort | uniq`
    TEMP4="${TEMP3//"model name"}"
    CPU=`echo $TEMP4 | awk '{print $2" "$3" "$4" "$5" "$6" "$7" "$8" "$9" "$10}'`

    TEMP5=`glxinfo | grep "Device"`
    TEMP6="${TEMP5//"Device:"}"
    GPU=`echo "${TEMP6%%(*}"`

    if [[ "$GPU" == '' ]]; then
        GPU="Command glxinfo not found! Install the package \"mesa-utils\"!!!"
    fi

    if [[ "$CPU" == '' ]]; then
        CPU="CPU Info on BSD is in development. If you see this on linux, something may or may be wrong. (/proc/cpuinfo not found!)"
    fi


    # aaand here are the distro logos!
    # MAKE SURE TO REPLACE SPACES WITH WHITESPACE ASCII CHARACTERS FOR IT WILL BREAK!!!

    if [[ "$DISTRO" == 'NixOS' ]]; then
        LINE1='⠀⠀⠀⠸⣿⡄⠀⢻⣷⣠⣿⠇⠀⠀⠀ '
        LINE2='⠀⢀⣶⣶⣿⣿⣶⣶⡿⣿⡏⠀⣠⡀⠀ '
        LINE3='⠀⠀⠀⢠⣶⠆   ⠹⣷⣴⣿⠃⠀ '
        LINE4='⢾⣿⣿⣿⣏     ⣹⣿⣿⣿⡷ '
        LINE5='⠀⢠⣿⠟⣿⣆   ⠰⠿⠃⠀⠀⠀ '
        LINE6='⠀⠈⠋⠀⣸⣿⣿⠿⠿⣿⣿⠿⠟⠁⠀ '
        LINE7='⠀⠀⠀⢰⣿⠋⢿⣧⠀⠘⣿⡆⠀⠀⠀ '
        LINE8='                '
        LINE9='                '
    elif [[ "$DISTRO" == 'Debian GNU/Linux' ]]; then
        LINE1='⠀⠀⣠⣶⠿⠶⠶⣤⣄⠀ '
        LINE2='⢀⡾⠋⠀⠀⠀⠀⠈⢻⡧ '
        LINE3='⣾⠁⠀⠀⠌⠁⠈⠀⠈⡇ '
        LINE4='⣏⠀⠀⢀⡄⠀⠀⠀⣰⠃ '
        LINE5='⢹⡄⠀⠀⠙⠲⠒⠊⠁⠀ '
        LINE6='⠀⢻⡀        '
        LINE7=' ⠀⠙⠦⣀⠀⠀⠀⠀⠀ '
        LINE8='           '
        LINE9='           '
    elif [[ "$DISTRO" == 'Arch Linux' ]]; then
        LINE1='           '
        LINE2='⠀⠀⠀⠀⢰⣆⠀⠀⠀⠀ '
        LINE3='⠀⠀⠀⢠⣿⣿⡄⠀⠀⠀ '
        LINE4='⠀⠀⢠⣿⣿⣿⣿⡄⠀⠀ '
        LINE5='⠀⣠⣿⣿⠁⠈⣿⣿⣆⠀ '
        LINE6='⡰⠟⠋⠉⠀⠀⠉⠙⠻⢆ '
        LINE7='           '
        LINE8='           '
        LINE9='           '
    elif [[ "$DISTRO" == 'Gentoo' ]]; then
        LINE1='           '
        LINE2='⠀⢠⣴⣶⣶⣦⣄⢀⠀⠀ '
        LINE3='⢀⠿⣿⣯⣐⣆⣿⣷⣕⠄ '
        LINE4='⠀⠉⣒⣽⣿⣿⣿⡿⢏⠔ '
        LINE5='⠀⣾⣿⣿⣿⠿⣋⠔⠉⠀ '
        LINE6='⠡⣝⣫⡭⠖⠋⠁⠀⠀⠀ '
        LINE7='           '
        LINE8='           '
        LINE9='           '
    elif [[ "$DISTRO" == 'EndeavourOS' ]]; then # my (plasmacotton) distro of choice
        LINE1='           '
        LINE2='⠀⠀⠀⠀⢠⣾⣦⡀⠀⠀ '
        LINE3='⠀⠀⢀⣴⣿⣿⣿⣿⣄⠀ '
        LINE4='⢀⣴⣿⣿⣿⣿⣿⣿⣿⣆ '
        LINE5='⠈⠽⠿⠿⠿⠿⠿⠿⠟⠋ '
        LINE6='           '
        LINE7='           '
        LINE8='           '
        LINE9='           '
    elif [[ "$DISTRO" == 'Bedrock' ]]; then
        LINE1='         '
        LINE2='⣀⣀⠀      '
        LINE3='⢧⠀⢱⡀     '
        LINE4=' ⢦⠀⠈⠉⠉⠉⢦⠀'
        LINE5='  ⢆⠀⠐⠒⠀⢨ '
        LINE6='  ⠘⠦⠤⠤⠤⠃ '
        LINE7='         '
        LINE8='         '
        LINE9='         '
    elif [[ "$OS" == 'Android' ]]; then
        LINE1='⠀⠀⠀⠀⢂⣀⣀⣀⡐⠀⠀⠀⠀ '
        LINE2='⠀⠀⢀⣴⣟⣿⣿⣿⣻⣦⡀⠀⠀ '
        LINE3='⢀⣀⢘⣛⣛⣛⣛⣛⣛⣛⡃⣀⡀ '
        LINE4='⢸⣿⢸⣿⣿⣿⣿⣿⣿⣿⡇⣿⡇ '
        LINE5='⢸⣿⢸⣿⣿⣿⣿⣿⣿⣿⡇⣿⡇ '
        LINE6='⠘⠛⢸⣿⣿⣿⣿⣿⣿⣿⡇⠛⠃ '
        LINE7='⠀⠀⠈⠉⣿⣿⠉⣿⣿⠉⠁⠀⠀ '
        LINE8='⠀⠀⠀⠀⠻⠟⠀⠻⠟⠀⠀⠀⠀ '
        LINE9='              '
    elif [[ "$DISTRO" == 'Ubuntu' ]]; then
        LINE1='           '
        LINE2='⠀⠀⠀⠀⢀⣠⣄⢴⡶⠀⠀'
        LINE3='⠀⠀⢀⣾⡆⠛⠛⠳⣶⡀⠀'
        LINE4='⠀⢾⡷⣿⠀⠀⠀⠀⣉⡁⠀'
        LINE5='⠀⠀⠈⢿⠇⣤⣤⡴⠿⠁⠀'
        LINE6='⠀⠀⠀⠀⠈⠙⠋⠺⠷⠀⠀'
        LINE7='           '
        LINE8='           '
        LINE9='           '
    elif [[ "$DISTRO" == 'Fedora Linux' ]]; then
        LINE1='           '
        LINE2='⠀⣠⣴⣾⣿⣿⣷⣦⣄⠀ '
        LINE3='⣰⣿⣿⣿⡏⢡⣄⢹⣿⣆ '
        LINE4='⣿⣿⠟⣛⡇⢘⣻⣿⣿⣿ '
        LINE5='⣿⣇⠸⡿⠇⣼⣿⣿⣿⠏ '
        LINE6='⢿⣿⣷⣶⣾⣿⡿⠟⠋⠀ '
        LINE7='           '
        LINE8='           '
        LINE9='           '
    elif [[ "$DISTRO" == 'KaOS' ]]; then # do people know this distro exists?
        LINE1='          '
        LINE2='⠀⠀⢀⠀⠀⣀⣄⡀⠀⠀'
        LINE3='⠀⢸⣿⢀⡾⠟⠋⠀⠀⠀'
        LINE4='⠀⠘⣿⣾⣶⣶⣶⣤⡀⠀'
        LINE5='⠀⠀⠘⠀⠘⡿⣎⣫⠇⠀'
        LINE6='⠀⠀⠀⠀⠀⠀⠉⠁⠀⠀'
        LINE7='          '
        LINE8='          '
        LINE9='          '
    elif [[ "$DISTRO" == 'Oreon' ]]; then
        LINE1='              '
        LINE2='   ⣴⣶⣶⣶⣶⣶⣦⠀   '
        LINE3='  ⣼⡿⠋   ⠙⢿⣧⠀  '
        LINE4='⢀⣾⣿⠀⠀⠀⠀⠀⠀⠀⣿⣷⡀⠀'
        LINE5=' ⢿⣿⠀⠀⠀⠀⠀⠀⠀⣿⡿⠁⠀'
        LINE6='  ⢻⣷⣄   ⣠⣾⡟⠀  '
        LINE7='   ⠻⠿⠿⠿⠿⠿⠟⠀   '
        LINE8='              '
        LINE9='              '
    elif [[ "$DISTRO" == 'Void' ]]; then
        LINE1='          '
        LINE2='⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀'
        LINE3='⠀⠀⠐⠟⠛⠻⣶⡄⠀⠀'
        LINE4='⠀⣿⠀⢠⣶⡄⠈⣿⡄⠀'
        LINE5='⠘⣿⡀⠘⠿⠃⠀⣿⠃⠀'
        LINE6='⠀⠘⠿⣦⣤⣴⠄⠀⠀⠀'
        LINE7='⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀'
        LINE8='          '
        LINE9='          '
    elif [[ "$DISTRO" == 'Solus' ]]; then
        LINE1='            '
        LINE2='⠀⢀⣤⠖⡛⠛⠛⠶⣤⡀⠀ '
        LINE3='⢠⠟⠀⣸⣷⡀⠀⠀⠈⢻⡄⠀'
        LINE4='⡿⠀⣰⣿⣿⡇⣦⡠⣄⡀⣿⠀'
        LINE5='⣷⠰⠿⠿⠿⡇⣿⠿⠜⡁⣿⠀'
        LINE6='⠘⣦⠲⢶⣶⣶⣶⡾⢋⣼⠃⠀'
        LINE7='⠀⠈⠛⠦⣬⣭⣤⠴⠛⠁⠀⠀'
        LINE8='            '
        LINE9='            '
    elif [[ "$DISTRO" == 'Red Hat Enterprise Linux' ]]; then
        LINE1='           '
        LINE2='           '
        LINE3='⠀⠀⢠⣿⣶⣿⣶⣄⠀⠀ '
        LINE4='⣠⣤⠘⢿⣿⣿⣿⣿⡀⠀ '
        LINE5='⠻⣿⣷⣤⣈⣉⣉⣉⣼⣦ '
        LINE6='⠀⠈⠙⠻⠿⢿⣿⣿⡿⠟ '
        LINE7='           '
        LINE8='           '
        LINE9='           '
    elif [[ "$DISTRO" == '*openSUSE*' ]]; then
        LINE1='           '
        LINE2='           '
        LINE3='⠀⣠⣶⣿⣿⣿⣷⣾⣶⣦ '
        LINE4='⡼⣻⣛⢿⡿⢿⣿⠿⠾⠙ '
        LINE5='⠳⣕⡼⠈⠀⠀⠙⠀⠀⠀ '
        LINE6=' openSUSE  '
        LINE7='           '
        LINE8='           '
        LINE9='           '
     elif [[ "$DISTRO" == 'FreeBSD' ]]; then
         LINE1='             '
         LINE2='⢿⣷⢆⣤⣶⣶⣶⡶⣦⣴⣾⡿ '
         LINE3='⠈⣵⣿⣿⣿⣿⣿⣷⣿⣿⡿⡁ '
         LINE4='⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿ '
         LINE5='⠀⢻⣿⣿⣿⣿⣿⣿⣿⣿⡿⠃ '
         LINE6='⠀⠀⠙⠻⢿⣿⣿⣿⠿⠋⠁⠀ '
         LINE7='             '
         LINE8='             '
         LINE9='             '
    else
        notify-send "Hey there! Seems like we didn't find your distribution logo. You can help add it in by contacting @plasmacotton on Discord!"
    fi

    # THIS IS THE PART IT PRINTS OUT!!! THIS IS WHAT YOU WANT TO EDIT IF YOU WANT TO CUSTOMIZE IT!!

    echo
    echo $LINE1"┌────"$USERNAME"@"$HOST"────"
    echo $LINE2"│ OS:" $OS "("$DISTRO")"
    echo $LINE3"│ Kernel:" $KERNEL", version" $KERNELVER
    echo $LINE4"│ Architecture:" $ARCH
    echo $LINE5"│ RAM:" $RAMUSED"/"$RAM"MB"
    echo $LINE6"│ CPU:" $CPU
    echo $LINE7"│ GPU:" $GPU
    echo $LINE8"│"
    echo $LINE9"│"
    echo $LINE9"│ "$MSG
    echo
fi
