#!/bin/bash

help() {
    ""
    echo "usage: $0 COMMAND" && echo
    echo "Commands:"
    echo "  hello"
    echo "  cal"
    exit 0
}

hello_help() {
    echo ""
    echo "Usage: $0 hello [OPTIONS]" && echo
    echo "hello [name] syntax output" && echo
    echo "Options:"
    echo "  -n name      show hello [name]"
    exit 0
}

calculator_help() {
    echo ""
    echo "Usage: $0 cal OPTIONS num1 num2" && echo
    echo "Calculate num1 and num2 by [add|sub|mul|div]"
    echo "Options:"
    echo "  -a          Add num1 to num2"
    echo "  -s          Subtract num1 to num2"
    echo "  -m          Multiplication num1 to num2"
    echo "  -d          Division num1 to num2"
    exit 0
}

if [ $# -eq 0 ]; then
    help
    exit 0
fi

case $1 in
    hello)
        shift $OPTIND
        while getopts ":n:h" opt
        do
            case $opt in
                n)
                    echo "Hello $OPTARG"
                    ;;
                h) hello_help ;;
                \?) hello_help ;;
                *) echo "Unknown option: $opt";;
            esac
        done
        ;;
    cal)
        shift $OPTIND
        while getopts "a:s:m:d:h" opt
        do
            case $opt in
                a) 
                    num1=$OPTARG
                    shift $(( OPTIND - 1 ))
                    num2=$1
                    expr $num1 + $num2
                    ;;
                s)
                    num1=$OPTARG
                    shift $(( OPTIND - 1 ))
                    num2=$1
                    expr $num1 - $num2
                    ;;
                m)
                    num1=$OPTARG
                    shift $(( OPTIND - 1 ))
                    num2=$1
                    expr $num1 * $num2
                    ;;
                d)  
                    num1=$OPTARG
                    shift $(( OPTIND - 1 ))
                    num2=$1
                    expr $num1 / $num2
                    ;;
                h) calculator_help ;;
                \?) calculator_help ;;
            esac
        done
        ;;
esac