#
# Random java stuff
#
# Mostly to be able to run javacode and tests using the command line.
# "Made for" the subject TDT4100 - NTNU
#
#
function java-run-build-jar(){
    mkdir .build/ 2>/dev/null
    javac -d .build/ **/*.java
    (cd .build; jar cvf ~/src/javalibs/stuff.jar *)
    echo "Created stuff.jar :)"
}

function java-run-fxml(){
    if [ -z "$1" ]
    then
        echo -e "Usage:\n\t$0 [fxmlfile(s)]"
        return 1
    fi
    (
    cd ~/src/wiki.tdt4100/oppgaver/src/
    for fxml in "${@:1}"; do
        controller=$(echo $fxml | sed "s/\.java/Controller\.java/")
        if [ ! -f $(echo $controller | sed "s/\.java/\.class/") ]; then
            javac $controller
        fi
        java no.hal.javafx.fxmlapp.lib.FxmlApplication --fxml=$(echo $fxml | sed "s/\.java/\.fxml/") &
    done
    )
}

function java-run-tests(){
    if [ -z "$1" ]
    then
        echo -e "Usage:\n\t [testclasse(s)]"
        return 1
    fi
    for test in "${@:1}"; do
        test=$(echo $test | sed "s/\.java/Test\.java/")
        (
        if [ ! -f $test ]; then
            cd ~/src/wiki.tdt4100/oppgaver/tests/
        fi
        
        if [ ! -f $test ]; then
            cd ~/src/wiki.tdt4100/oppgaver/src-gen/
        fi
        echo $PWD/$test
        if [ ! -f $(echo $test | sed "s/\.java/\.class/") ]; then
            javac $test
        fi
        name=$(echo $test | sed "s/\//./" | sed "s/\.java//")
        echo -e "Running test:\e[32m\e[1m $name \e[0m"
        java org.junit.runner.JUnitCore $name
        )
    done
}

export PATH=$PATH:~/eclipse/tdt4100-2017-master2/eclipse
